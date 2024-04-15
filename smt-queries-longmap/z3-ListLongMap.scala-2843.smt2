; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41030 () Bool)

(assert start!41030)

(declare-fun b_free!10957 () Bool)

(declare-fun b_next!10957 () Bool)

(assert (=> start!41030 (= b_free!10957 (not b_next!10957))))

(declare-fun tp!38700 () Bool)

(declare-fun b_and!19095 () Bool)

(assert (=> start!41030 (= tp!38700 b_and!19095)))

(declare-fun b!457131 () Bool)

(declare-fun e!266982 () Bool)

(declare-fun e!266988 () Bool)

(assert (=> b!457131 (= e!266982 (not e!266988))))

(declare-fun res!272979 () Bool)

(assert (=> b!457131 (=> res!272979 e!266988)))

(declare-datatypes ((array!28383 0))(
  ( (array!28384 (arr!13634 (Array (_ BitVec 32) (_ BitVec 64))) (size!13987 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28383)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457131 (= res!272979 (not (validKeyInArray!0 (select (arr!13634 _keys!709) from!863))))))

(declare-datatypes ((V!17499 0))(
  ( (V!17500 (val!6192 Int)) )
))
(declare-datatypes ((tuple2!8180 0))(
  ( (tuple2!8181 (_1!4101 (_ BitVec 64)) (_2!4101 V!17499)) )
))
(declare-datatypes ((List!8244 0))(
  ( (Nil!8241) (Cons!8240 (h!9096 tuple2!8180) (t!14071 List!8244)) )
))
(declare-datatypes ((ListLongMap!7083 0))(
  ( (ListLongMap!7084 (toList!3557 List!8244)) )
))
(declare-fun lt!206668 () ListLongMap!7083)

(declare-fun lt!206670 () ListLongMap!7083)

(assert (=> b!457131 (= lt!206668 lt!206670)))

(declare-fun lt!206666 () ListLongMap!7083)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17499)

(declare-fun +!1611 (ListLongMap!7083 tuple2!8180) ListLongMap!7083)

(assert (=> b!457131 (= lt!206670 (+!1611 lt!206666 (tuple2!8181 k0!794 v!412)))))

(declare-fun minValue!515 () V!17499)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5804 0))(
  ( (ValueCellFull!5804 (v!8456 V!17499)) (EmptyCell!5804) )
))
(declare-datatypes ((array!28385 0))(
  ( (array!28386 (arr!13635 (Array (_ BitVec 32) ValueCell!5804)) (size!13988 (_ BitVec 32))) )
))
(declare-fun lt!206665 () array!28385)

(declare-fun lt!206667 () array!28383)

(declare-fun zeroValue!515 () V!17499)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1752 (array!28383 array!28385 (_ BitVec 32) (_ BitVec 32) V!17499 V!17499 (_ BitVec 32) Int) ListLongMap!7083)

(assert (=> b!457131 (= lt!206668 (getCurrentListMapNoExtraKeys!1752 lt!206667 lt!206665 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28385)

(assert (=> b!457131 (= lt!206666 (getCurrentListMapNoExtraKeys!1752 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13271 0))(
  ( (Unit!13272) )
))
(declare-fun lt!206669 () Unit!13271)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!748 (array!28383 array!28385 (_ BitVec 32) (_ BitVec 32) V!17499 V!17499 (_ BitVec 32) (_ BitVec 64) V!17499 (_ BitVec 32) Int) Unit!13271)

(assert (=> b!457131 (= lt!206669 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!748 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457132 () Bool)

(declare-fun e!266985 () Bool)

(declare-fun e!266983 () Bool)

(declare-fun mapRes!20086 () Bool)

(assert (=> b!457132 (= e!266985 (and e!266983 mapRes!20086))))

(declare-fun condMapEmpty!20086 () Bool)

(declare-fun mapDefault!20086 () ValueCell!5804)

(assert (=> b!457132 (= condMapEmpty!20086 (= (arr!13635 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5804)) mapDefault!20086)))))

(declare-fun b!457133 () Bool)

(declare-fun e!266981 () Bool)

(declare-fun tp_is_empty!12295 () Bool)

(assert (=> b!457133 (= e!266981 tp_is_empty!12295)))

(declare-fun b!457134 () Bool)

(declare-fun e!266987 () Bool)

(declare-fun e!266984 () Bool)

(assert (=> b!457134 (= e!266987 e!266984)))

(declare-fun res!272973 () Bool)

(assert (=> b!457134 (=> (not res!272973) (not e!266984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28383 (_ BitVec 32)) Bool)

(assert (=> b!457134 (= res!272973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206667 mask!1025))))

(assert (=> b!457134 (= lt!206667 (array!28384 (store (arr!13634 _keys!709) i!563 k0!794) (size!13987 _keys!709)))))

(declare-fun b!457135 () Bool)

(declare-fun res!272976 () Bool)

(assert (=> b!457135 (=> (not res!272976) (not e!266987))))

(declare-datatypes ((List!8245 0))(
  ( (Nil!8242) (Cons!8241 (h!9097 (_ BitVec 64)) (t!14072 List!8245)) )
))
(declare-fun arrayNoDuplicates!0 (array!28383 (_ BitVec 32) List!8245) Bool)

(assert (=> b!457135 (= res!272976 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8242))))

(declare-fun b!457136 () Bool)

(declare-fun res!272966 () Bool)

(assert (=> b!457136 (=> (not res!272966) (not e!266984))))

(assert (=> b!457136 (= res!272966 (bvsle from!863 i!563))))

(declare-fun b!457137 () Bool)

(declare-fun res!272978 () Bool)

(assert (=> b!457137 (=> (not res!272978) (not e!266987))))

(assert (=> b!457137 (= res!272978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457138 () Bool)

(assert (=> b!457138 (= e!266984 e!266982)))

(declare-fun res!272971 () Bool)

(assert (=> b!457138 (=> (not res!272971) (not e!266982))))

(assert (=> b!457138 (= res!272971 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206663 () ListLongMap!7083)

(assert (=> b!457138 (= lt!206663 (getCurrentListMapNoExtraKeys!1752 lt!206667 lt!206665 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457138 (= lt!206665 (array!28386 (store (arr!13635 _values!549) i!563 (ValueCellFull!5804 v!412)) (size!13988 _values!549)))))

(declare-fun lt!206664 () ListLongMap!7083)

(assert (=> b!457138 (= lt!206664 (getCurrentListMapNoExtraKeys!1752 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457139 () Bool)

(declare-fun res!272977 () Bool)

(assert (=> b!457139 (=> (not res!272977) (not e!266987))))

(assert (=> b!457139 (= res!272977 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13987 _keys!709))))))

(declare-fun mapIsEmpty!20086 () Bool)

(assert (=> mapIsEmpty!20086 mapRes!20086))

(declare-fun b!457140 () Bool)

(declare-fun res!272972 () Bool)

(assert (=> b!457140 (=> (not res!272972) (not e!266987))))

(assert (=> b!457140 (= res!272972 (validKeyInArray!0 k0!794))))

(declare-fun b!457141 () Bool)

(declare-fun res!272967 () Bool)

(assert (=> b!457141 (=> (not res!272967) (not e!266987))))

(assert (=> b!457141 (= res!272967 (and (= (size!13988 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13987 _keys!709) (size!13988 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457142 () Bool)

(assert (=> b!457142 (= e!266988 (bvslt from!863 (size!13987 _keys!709)))))

(declare-fun get!6712 (ValueCell!5804 V!17499) V!17499)

(declare-fun dynLambda!873 (Int (_ BitVec 64)) V!17499)

(assert (=> b!457142 (= lt!206663 (+!1611 lt!206670 (tuple2!8181 (select (arr!13634 _keys!709) from!863) (get!6712 (select (arr!13635 _values!549) from!863) (dynLambda!873 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!272969 () Bool)

(assert (=> start!41030 (=> (not res!272969) (not e!266987))))

(assert (=> start!41030 (= res!272969 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13987 _keys!709))))))

(assert (=> start!41030 e!266987))

(assert (=> start!41030 tp_is_empty!12295))

(assert (=> start!41030 tp!38700))

(assert (=> start!41030 true))

(declare-fun array_inv!9932 (array!28385) Bool)

(assert (=> start!41030 (and (array_inv!9932 _values!549) e!266985)))

(declare-fun array_inv!9933 (array!28383) Bool)

(assert (=> start!41030 (array_inv!9933 _keys!709)))

(declare-fun mapNonEmpty!20086 () Bool)

(declare-fun tp!38701 () Bool)

(assert (=> mapNonEmpty!20086 (= mapRes!20086 (and tp!38701 e!266981))))

(declare-fun mapKey!20086 () (_ BitVec 32))

(declare-fun mapValue!20086 () ValueCell!5804)

(declare-fun mapRest!20086 () (Array (_ BitVec 32) ValueCell!5804))

(assert (=> mapNonEmpty!20086 (= (arr!13635 _values!549) (store mapRest!20086 mapKey!20086 mapValue!20086))))

(declare-fun b!457143 () Bool)

(declare-fun res!272970 () Bool)

(assert (=> b!457143 (=> (not res!272970) (not e!266987))))

(assert (=> b!457143 (= res!272970 (or (= (select (arr!13634 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13634 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457144 () Bool)

(declare-fun res!272975 () Bool)

(assert (=> b!457144 (=> (not res!272975) (not e!266987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457144 (= res!272975 (validMask!0 mask!1025))))

(declare-fun b!457145 () Bool)

(declare-fun res!272968 () Bool)

(assert (=> b!457145 (=> (not res!272968) (not e!266984))))

(assert (=> b!457145 (= res!272968 (arrayNoDuplicates!0 lt!206667 #b00000000000000000000000000000000 Nil!8242))))

(declare-fun b!457146 () Bool)

(declare-fun res!272974 () Bool)

(assert (=> b!457146 (=> (not res!272974) (not e!266987))))

(declare-fun arrayContainsKey!0 (array!28383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457146 (= res!272974 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457147 () Bool)

(assert (=> b!457147 (= e!266983 tp_is_empty!12295)))

(assert (= (and start!41030 res!272969) b!457144))

(assert (= (and b!457144 res!272975) b!457141))

(assert (= (and b!457141 res!272967) b!457137))

(assert (= (and b!457137 res!272978) b!457135))

(assert (= (and b!457135 res!272976) b!457139))

(assert (= (and b!457139 res!272977) b!457140))

(assert (= (and b!457140 res!272972) b!457143))

(assert (= (and b!457143 res!272970) b!457146))

(assert (= (and b!457146 res!272974) b!457134))

(assert (= (and b!457134 res!272973) b!457145))

(assert (= (and b!457145 res!272968) b!457136))

(assert (= (and b!457136 res!272966) b!457138))

(assert (= (and b!457138 res!272971) b!457131))

(assert (= (and b!457131 (not res!272979)) b!457142))

(assert (= (and b!457132 condMapEmpty!20086) mapIsEmpty!20086))

(assert (= (and b!457132 (not condMapEmpty!20086)) mapNonEmpty!20086))

(get-info :version)

(assert (= (and mapNonEmpty!20086 ((_ is ValueCellFull!5804) mapValue!20086)) b!457133))

(assert (= (and b!457132 ((_ is ValueCellFull!5804) mapDefault!20086)) b!457147))

(assert (= start!41030 b!457132))

(declare-fun b_lambda!9705 () Bool)

(assert (=> (not b_lambda!9705) (not b!457142)))

(declare-fun t!14070 () Bool)

(declare-fun tb!3785 () Bool)

(assert (=> (and start!41030 (= defaultEntry!557 defaultEntry!557) t!14070) tb!3785))

(declare-fun result!7119 () Bool)

(assert (=> tb!3785 (= result!7119 tp_is_empty!12295)))

(assert (=> b!457142 t!14070))

(declare-fun b_and!19097 () Bool)

(assert (= b_and!19095 (and (=> t!14070 result!7119) b_and!19097)))

(declare-fun m!440027 () Bool)

(assert (=> start!41030 m!440027))

(declare-fun m!440029 () Bool)

(assert (=> start!41030 m!440029))

(declare-fun m!440031 () Bool)

(assert (=> b!457137 m!440031))

(declare-fun m!440033 () Bool)

(assert (=> b!457143 m!440033))

(declare-fun m!440035 () Bool)

(assert (=> b!457134 m!440035))

(declare-fun m!440037 () Bool)

(assert (=> b!457134 m!440037))

(declare-fun m!440039 () Bool)

(assert (=> b!457140 m!440039))

(declare-fun m!440041 () Bool)

(assert (=> b!457142 m!440041))

(declare-fun m!440043 () Bool)

(assert (=> b!457142 m!440043))

(declare-fun m!440045 () Bool)

(assert (=> b!457142 m!440045))

(declare-fun m!440047 () Bool)

(assert (=> b!457142 m!440047))

(assert (=> b!457142 m!440047))

(assert (=> b!457142 m!440043))

(declare-fun m!440049 () Bool)

(assert (=> b!457142 m!440049))

(declare-fun m!440051 () Bool)

(assert (=> b!457135 m!440051))

(declare-fun m!440053 () Bool)

(assert (=> b!457145 m!440053))

(declare-fun m!440055 () Bool)

(assert (=> b!457138 m!440055))

(declare-fun m!440057 () Bool)

(assert (=> b!457138 m!440057))

(declare-fun m!440059 () Bool)

(assert (=> b!457138 m!440059))

(declare-fun m!440061 () Bool)

(assert (=> b!457144 m!440061))

(declare-fun m!440063 () Bool)

(assert (=> mapNonEmpty!20086 m!440063))

(assert (=> b!457131 m!440041))

(declare-fun m!440065 () Bool)

(assert (=> b!457131 m!440065))

(declare-fun m!440067 () Bool)

(assert (=> b!457131 m!440067))

(assert (=> b!457131 m!440041))

(declare-fun m!440069 () Bool)

(assert (=> b!457131 m!440069))

(declare-fun m!440071 () Bool)

(assert (=> b!457131 m!440071))

(declare-fun m!440073 () Bool)

(assert (=> b!457131 m!440073))

(declare-fun m!440075 () Bool)

(assert (=> b!457146 m!440075))

(check-sat (not b!457134) (not b_lambda!9705) (not b!457146) (not b!457138) (not b!457131) tp_is_empty!12295 (not b_next!10957) (not mapNonEmpty!20086) (not b!457145) (not b!457135) (not start!41030) (not b!457142) (not b!457144) (not b!457137) (not b!457140) b_and!19097)
(check-sat b_and!19097 (not b_next!10957))
