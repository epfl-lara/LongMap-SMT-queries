; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41036 () Bool)

(assert start!41036)

(declare-fun b_free!10963 () Bool)

(declare-fun b_next!10963 () Bool)

(assert (=> start!41036 (= b_free!10963 (not b_next!10963))))

(declare-fun tp!38718 () Bool)

(declare-fun b_and!19143 () Bool)

(assert (=> start!41036 (= tp!38718 b_and!19143)))

(declare-fun mapIsEmpty!20095 () Bool)

(declare-fun mapRes!20095 () Bool)

(assert (=> mapIsEmpty!20095 mapRes!20095))

(declare-fun b!457500 () Bool)

(declare-fun res!273218 () Bool)

(declare-fun e!267191 () Bool)

(assert (=> b!457500 (=> (not res!273218) (not e!267191))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28396 0))(
  ( (array!28397 (arr!13640 (Array (_ BitVec 32) (_ BitVec 64))) (size!13992 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28396)

(assert (=> b!457500 (= res!273218 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13992 _keys!709))))))

(declare-fun b!457501 () Bool)

(declare-fun e!267188 () Bool)

(declare-fun e!267192 () Bool)

(assert (=> b!457501 (= e!267188 e!267192)))

(declare-fun res!273219 () Bool)

(assert (=> b!457501 (=> (not res!273219) (not e!267192))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!457501 (= res!273219 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206987 () array!28396)

(declare-datatypes ((V!17507 0))(
  ( (V!17508 (val!6195 Int)) )
))
(declare-fun minValue!515 () V!17507)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17507)

(declare-datatypes ((tuple2!8078 0))(
  ( (tuple2!8079 (_1!4050 (_ BitVec 64)) (_2!4050 V!17507)) )
))
(declare-datatypes ((List!8151 0))(
  ( (Nil!8148) (Cons!8147 (h!9003 tuple2!8078) (t!13985 List!8151)) )
))
(declare-datatypes ((ListLongMap!6993 0))(
  ( (ListLongMap!6994 (toList!3512 List!8151)) )
))
(declare-fun lt!206986 () ListLongMap!6993)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5807 0))(
  ( (ValueCellFull!5807 (v!8466 V!17507)) (EmptyCell!5807) )
))
(declare-datatypes ((array!28398 0))(
  ( (array!28399 (arr!13641 (Array (_ BitVec 32) ValueCell!5807)) (size!13993 (_ BitVec 32))) )
))
(declare-fun lt!206988 () array!28398)

(declare-fun getCurrentListMapNoExtraKeys!1741 (array!28396 array!28398 (_ BitVec 32) (_ BitVec 32) V!17507 V!17507 (_ BitVec 32) Int) ListLongMap!6993)

(assert (=> b!457501 (= lt!206986 (getCurrentListMapNoExtraKeys!1741 lt!206987 lt!206988 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28398)

(declare-fun v!412 () V!17507)

(assert (=> b!457501 (= lt!206988 (array!28399 (store (arr!13641 _values!549) i!563 (ValueCellFull!5807 v!412)) (size!13993 _values!549)))))

(declare-fun lt!206984 () ListLongMap!6993)

(assert (=> b!457501 (= lt!206984 (getCurrentListMapNoExtraKeys!1741 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457502 () Bool)

(declare-fun res!273227 () Bool)

(assert (=> b!457502 (=> (not res!273227) (not e!267188))))

(assert (=> b!457502 (= res!273227 (bvsle from!863 i!563))))

(declare-fun b!457503 () Bool)

(declare-fun e!267195 () Bool)

(declare-fun e!267190 () Bool)

(assert (=> b!457503 (= e!267195 (and e!267190 mapRes!20095))))

(declare-fun condMapEmpty!20095 () Bool)

(declare-fun mapDefault!20095 () ValueCell!5807)

(assert (=> b!457503 (= condMapEmpty!20095 (= (arr!13641 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5807)) mapDefault!20095)))))

(declare-fun b!457504 () Bool)

(declare-fun res!273217 () Bool)

(assert (=> b!457504 (=> (not res!273217) (not e!267188))))

(declare-datatypes ((List!8152 0))(
  ( (Nil!8149) (Cons!8148 (h!9004 (_ BitVec 64)) (t!13986 List!8152)) )
))
(declare-fun arrayNoDuplicates!0 (array!28396 (_ BitVec 32) List!8152) Bool)

(assert (=> b!457504 (= res!273217 (arrayNoDuplicates!0 lt!206987 #b00000000000000000000000000000000 Nil!8149))))

(declare-fun res!273220 () Bool)

(assert (=> start!41036 (=> (not res!273220) (not e!267191))))

(assert (=> start!41036 (= res!273220 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13992 _keys!709))))))

(assert (=> start!41036 e!267191))

(declare-fun tp_is_empty!12301 () Bool)

(assert (=> start!41036 tp_is_empty!12301))

(assert (=> start!41036 tp!38718))

(assert (=> start!41036 true))

(declare-fun array_inv!9950 (array!28398) Bool)

(assert (=> start!41036 (and (array_inv!9950 _values!549) e!267195)))

(declare-fun array_inv!9951 (array!28396) Bool)

(assert (=> start!41036 (array_inv!9951 _keys!709)))

(declare-fun b!457505 () Bool)

(declare-fun res!273222 () Bool)

(assert (=> b!457505 (=> (not res!273222) (not e!267191))))

(assert (=> b!457505 (= res!273222 (and (= (size!13993 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13992 _keys!709) (size!13993 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457506 () Bool)

(declare-fun res!273223 () Bool)

(assert (=> b!457506 (=> (not res!273223) (not e!267191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457506 (= res!273223 (validMask!0 mask!1025))))

(declare-fun b!457507 () Bool)

(declare-fun res!273225 () Bool)

(assert (=> b!457507 (=> (not res!273225) (not e!267191))))

(assert (=> b!457507 (= res!273225 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8149))))

(declare-fun b!457508 () Bool)

(declare-fun e!267194 () Bool)

(assert (=> b!457508 (= e!267194 tp_is_empty!12301)))

(declare-fun b!457509 () Bool)

(declare-fun res!273221 () Bool)

(assert (=> b!457509 (=> (not res!273221) (not e!267191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28396 (_ BitVec 32)) Bool)

(assert (=> b!457509 (= res!273221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457510 () Bool)

(declare-fun res!273215 () Bool)

(assert (=> b!457510 (=> (not res!273215) (not e!267191))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457510 (= res!273215 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457511 () Bool)

(declare-fun res!273226 () Bool)

(assert (=> b!457511 (=> (not res!273226) (not e!267191))))

(assert (=> b!457511 (= res!273226 (or (= (select (arr!13640 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13640 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457512 () Bool)

(declare-fun res!273214 () Bool)

(assert (=> b!457512 (=> (not res!273214) (not e!267191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457512 (= res!273214 (validKeyInArray!0 k0!794))))

(declare-fun b!457513 () Bool)

(declare-fun e!267193 () Bool)

(assert (=> b!457513 (= e!267193 true)))

(declare-fun lt!206982 () ListLongMap!6993)

(declare-fun +!1594 (ListLongMap!6993 tuple2!8078) ListLongMap!6993)

(declare-fun get!6721 (ValueCell!5807 V!17507) V!17507)

(declare-fun dynLambda!877 (Int (_ BitVec 64)) V!17507)

(assert (=> b!457513 (= lt!206986 (+!1594 lt!206982 (tuple2!8079 (select (arr!13640 _keys!709) from!863) (get!6721 (select (arr!13641 _values!549) from!863) (dynLambda!877 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!20095 () Bool)

(declare-fun tp!38719 () Bool)

(assert (=> mapNonEmpty!20095 (= mapRes!20095 (and tp!38719 e!267194))))

(declare-fun mapRest!20095 () (Array (_ BitVec 32) ValueCell!5807))

(declare-fun mapKey!20095 () (_ BitVec 32))

(declare-fun mapValue!20095 () ValueCell!5807)

(assert (=> mapNonEmpty!20095 (= (arr!13641 _values!549) (store mapRest!20095 mapKey!20095 mapValue!20095))))

(declare-fun b!457514 () Bool)

(assert (=> b!457514 (= e!267191 e!267188)))

(declare-fun res!273224 () Bool)

(assert (=> b!457514 (=> (not res!273224) (not e!267188))))

(assert (=> b!457514 (= res!273224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206987 mask!1025))))

(assert (=> b!457514 (= lt!206987 (array!28397 (store (arr!13640 _keys!709) i!563 k0!794) (size!13992 _keys!709)))))

(declare-fun b!457515 () Bool)

(assert (=> b!457515 (= e!267190 tp_is_empty!12301)))

(declare-fun b!457516 () Bool)

(assert (=> b!457516 (= e!267192 (not e!267193))))

(declare-fun res!273216 () Bool)

(assert (=> b!457516 (=> res!273216 e!267193)))

(assert (=> b!457516 (= res!273216 (not (validKeyInArray!0 (select (arr!13640 _keys!709) from!863))))))

(declare-fun lt!206983 () ListLongMap!6993)

(assert (=> b!457516 (= lt!206983 lt!206982)))

(declare-fun lt!206985 () ListLongMap!6993)

(assert (=> b!457516 (= lt!206982 (+!1594 lt!206985 (tuple2!8079 k0!794 v!412)))))

(assert (=> b!457516 (= lt!206983 (getCurrentListMapNoExtraKeys!1741 lt!206987 lt!206988 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457516 (= lt!206985 (getCurrentListMapNoExtraKeys!1741 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13291 0))(
  ( (Unit!13292) )
))
(declare-fun lt!206981 () Unit!13291)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!753 (array!28396 array!28398 (_ BitVec 32) (_ BitVec 32) V!17507 V!17507 (_ BitVec 32) (_ BitVec 64) V!17507 (_ BitVec 32) Int) Unit!13291)

(assert (=> b!457516 (= lt!206981 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!41036 res!273220) b!457506))

(assert (= (and b!457506 res!273223) b!457505))

(assert (= (and b!457505 res!273222) b!457509))

(assert (= (and b!457509 res!273221) b!457507))

(assert (= (and b!457507 res!273225) b!457500))

(assert (= (and b!457500 res!273218) b!457512))

(assert (= (and b!457512 res!273214) b!457511))

(assert (= (and b!457511 res!273226) b!457510))

(assert (= (and b!457510 res!273215) b!457514))

(assert (= (and b!457514 res!273224) b!457504))

(assert (= (and b!457504 res!273217) b!457502))

(assert (= (and b!457502 res!273227) b!457501))

(assert (= (and b!457501 res!273219) b!457516))

(assert (= (and b!457516 (not res!273216)) b!457513))

(assert (= (and b!457503 condMapEmpty!20095) mapIsEmpty!20095))

(assert (= (and b!457503 (not condMapEmpty!20095)) mapNonEmpty!20095))

(get-info :version)

(assert (= (and mapNonEmpty!20095 ((_ is ValueCellFull!5807) mapValue!20095)) b!457508))

(assert (= (and b!457503 ((_ is ValueCellFull!5807) mapDefault!20095)) b!457515))

(assert (= start!41036 b!457503))

(declare-fun b_lambda!9743 () Bool)

(assert (=> (not b_lambda!9743) (not b!457513)))

(declare-fun t!13984 () Bool)

(declare-fun tb!3791 () Bool)

(assert (=> (and start!41036 (= defaultEntry!557 defaultEntry!557) t!13984) tb!3791))

(declare-fun result!7131 () Bool)

(assert (=> tb!3791 (= result!7131 tp_is_empty!12301)))

(assert (=> b!457513 t!13984))

(declare-fun b_and!19145 () Bool)

(assert (= b_and!19143 (and (=> t!13984 result!7131) b_and!19145)))

(declare-fun m!441093 () Bool)

(assert (=> b!457512 m!441093))

(declare-fun m!441095 () Bool)

(assert (=> b!457504 m!441095))

(declare-fun m!441097 () Bool)

(assert (=> b!457513 m!441097))

(declare-fun m!441099 () Bool)

(assert (=> b!457513 m!441099))

(assert (=> b!457513 m!441099))

(declare-fun m!441101 () Bool)

(assert (=> b!457513 m!441101))

(declare-fun m!441103 () Bool)

(assert (=> b!457513 m!441103))

(assert (=> b!457513 m!441101))

(declare-fun m!441105 () Bool)

(assert (=> b!457513 m!441105))

(declare-fun m!441107 () Bool)

(assert (=> start!41036 m!441107))

(declare-fun m!441109 () Bool)

(assert (=> start!41036 m!441109))

(declare-fun m!441111 () Bool)

(assert (=> mapNonEmpty!20095 m!441111))

(declare-fun m!441113 () Bool)

(assert (=> b!457509 m!441113))

(declare-fun m!441115 () Bool)

(assert (=> b!457514 m!441115))

(declare-fun m!441117 () Bool)

(assert (=> b!457514 m!441117))

(declare-fun m!441119 () Bool)

(assert (=> b!457507 m!441119))

(declare-fun m!441121 () Bool)

(assert (=> b!457501 m!441121))

(declare-fun m!441123 () Bool)

(assert (=> b!457501 m!441123))

(declare-fun m!441125 () Bool)

(assert (=> b!457501 m!441125))

(assert (=> b!457516 m!441097))

(declare-fun m!441127 () Bool)

(assert (=> b!457516 m!441127))

(assert (=> b!457516 m!441097))

(declare-fun m!441129 () Bool)

(assert (=> b!457516 m!441129))

(declare-fun m!441131 () Bool)

(assert (=> b!457516 m!441131))

(declare-fun m!441133 () Bool)

(assert (=> b!457516 m!441133))

(declare-fun m!441135 () Bool)

(assert (=> b!457516 m!441135))

(declare-fun m!441137 () Bool)

(assert (=> b!457506 m!441137))

(declare-fun m!441139 () Bool)

(assert (=> b!457510 m!441139))

(declare-fun m!441141 () Bool)

(assert (=> b!457511 m!441141))

(check-sat (not b!457510) (not b!457514) (not b!457506) b_and!19145 (not b!457509) (not b!457513) (not b!457501) (not b!457512) (not b!457516) (not b!457507) (not b_next!10963) (not b!457504) (not mapNonEmpty!20095) tp_is_empty!12301 (not start!41036) (not b_lambda!9743))
(check-sat b_and!19145 (not b_next!10963))
