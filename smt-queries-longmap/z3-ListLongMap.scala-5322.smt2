; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71152 () Bool)

(assert start!71152)

(declare-fun b_free!13339 () Bool)

(declare-fun b_next!13339 () Bool)

(assert (=> start!71152 (= b_free!13339 (not b_next!13339))))

(declare-fun tp!46776 () Bool)

(declare-fun b_and!22239 () Bool)

(assert (=> start!71152 (= tp!46776 b_and!22239)))

(declare-fun mapIsEmpty!24199 () Bool)

(declare-fun mapRes!24199 () Bool)

(assert (=> mapIsEmpty!24199 mapRes!24199))

(declare-fun b!826508 () Bool)

(declare-fun e!460302 () Bool)

(declare-fun tp_is_empty!15049 () Bool)

(assert (=> b!826508 (= e!460302 tp_is_empty!15049)))

(declare-fun mapNonEmpty!24199 () Bool)

(declare-fun tp!46777 () Bool)

(assert (=> mapNonEmpty!24199 (= mapRes!24199 (and tp!46777 e!460302))))

(declare-datatypes ((V!25067 0))(
  ( (V!25068 (val!7572 Int)) )
))
(declare-datatypes ((ValueCell!7109 0))(
  ( (ValueCellFull!7109 (v!10000 V!25067)) (EmptyCell!7109) )
))
(declare-fun mapValue!24199 () ValueCell!7109)

(declare-fun mapRest!24199 () (Array (_ BitVec 32) ValueCell!7109))

(declare-datatypes ((array!46241 0))(
  ( (array!46242 (arr!22166 (Array (_ BitVec 32) ValueCell!7109)) (size!22587 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46241)

(declare-fun mapKey!24199 () (_ BitVec 32))

(assert (=> mapNonEmpty!24199 (= (arr!22166 _values!788) (store mapRest!24199 mapKey!24199 mapValue!24199))))

(declare-fun b!826509 () Bool)

(declare-fun e!460305 () Bool)

(declare-fun e!460303 () Bool)

(assert (=> b!826509 (= e!460305 (and e!460303 mapRes!24199))))

(declare-fun condMapEmpty!24199 () Bool)

(declare-fun mapDefault!24199 () ValueCell!7109)

(assert (=> b!826509 (= condMapEmpty!24199 (= (arr!22166 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7109)) mapDefault!24199)))))

(declare-fun b!826511 () Bool)

(declare-fun e!460309 () Bool)

(assert (=> b!826511 (= e!460309 true)))

(declare-datatypes ((tuple2!10046 0))(
  ( (tuple2!10047 (_1!5034 (_ BitVec 64)) (_2!5034 V!25067)) )
))
(declare-datatypes ((List!15834 0))(
  ( (Nil!15831) (Cons!15830 (h!16959 tuple2!10046) (t!22172 List!15834)) )
))
(declare-datatypes ((ListLongMap!8859 0))(
  ( (ListLongMap!8860 (toList!4445 List!15834)) )
))
(declare-fun lt!374161 () ListLongMap!8859)

(declare-fun lt!374162 () ListLongMap!8859)

(declare-fun lt!374172 () tuple2!10046)

(declare-fun lt!374164 () tuple2!10046)

(declare-fun +!1979 (ListLongMap!8859 tuple2!10046) ListLongMap!8859)

(assert (=> b!826511 (= lt!374161 (+!1979 (+!1979 lt!374162 lt!374172) lt!374164))))

(declare-fun lt!374168 () ListLongMap!8859)

(declare-fun lt!374170 () ListLongMap!8859)

(declare-fun lt!374171 () ListLongMap!8859)

(assert (=> b!826511 (and (= lt!374168 lt!374170) (= lt!374171 lt!374170) (= lt!374171 lt!374168))))

(declare-fun lt!374160 () ListLongMap!8859)

(assert (=> b!826511 (= lt!374170 (+!1979 lt!374160 lt!374172))))

(declare-fun lt!374166 () ListLongMap!8859)

(assert (=> b!826511 (= lt!374168 (+!1979 lt!374166 lt!374172))))

(declare-fun zeroValueBefore!34 () V!25067)

(declare-fun zeroValueAfter!34 () V!25067)

(declare-datatypes ((Unit!28303 0))(
  ( (Unit!28304) )
))
(declare-fun lt!374165 () Unit!28303)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!242 (ListLongMap!8859 (_ BitVec 64) V!25067 V!25067) Unit!28303)

(assert (=> b!826511 (= lt!374165 (addSameAsAddTwiceSameKeyDiffValues!242 lt!374166 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460307 () Bool)

(assert (=> b!826511 e!460307))

(declare-fun res!563476 () Bool)

(assert (=> b!826511 (=> (not res!563476) (not e!460307))))

(declare-fun lt!374169 () ListLongMap!8859)

(assert (=> b!826511 (= res!563476 (= lt!374169 lt!374160))))

(declare-fun lt!374163 () tuple2!10046)

(assert (=> b!826511 (= lt!374160 (+!1979 lt!374166 lt!374163))))

(assert (=> b!826511 (= lt!374166 (+!1979 lt!374162 lt!374164))))

(assert (=> b!826511 (= lt!374172 (tuple2!10047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460308 () Bool)

(assert (=> b!826511 e!460308))

(declare-fun res!563477 () Bool)

(assert (=> b!826511 (=> (not res!563477) (not e!460308))))

(assert (=> b!826511 (= res!563477 (= lt!374169 (+!1979 (+!1979 lt!374162 lt!374163) lt!374164)))))

(declare-fun minValue!754 () V!25067)

(assert (=> b!826511 (= lt!374164 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826511 (= lt!374163 (tuple2!10047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46243 0))(
  ( (array!46244 (arr!22167 (Array (_ BitVec 32) (_ BitVec 64))) (size!22588 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46243)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2525 (array!46243 array!46241 (_ BitVec 32) (_ BitVec 32) V!25067 V!25067 (_ BitVec 32) Int) ListLongMap!8859)

(assert (=> b!826511 (= lt!374171 (getCurrentListMap!2525 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826511 (= lt!374169 (getCurrentListMap!2525 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826512 () Bool)

(declare-fun res!563475 () Bool)

(declare-fun e!460306 () Bool)

(assert (=> b!826512 (=> (not res!563475) (not e!460306))))

(declare-datatypes ((List!15835 0))(
  ( (Nil!15832) (Cons!15831 (h!16960 (_ BitVec 64)) (t!22173 List!15835)) )
))
(declare-fun arrayNoDuplicates!0 (array!46243 (_ BitVec 32) List!15835) Bool)

(assert (=> b!826512 (= res!563475 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15832))))

(declare-fun b!826513 () Bool)

(declare-fun res!563471 () Bool)

(assert (=> b!826513 (=> (not res!563471) (not e!460306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46243 (_ BitVec 32)) Bool)

(assert (=> b!826513 (= res!563471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826514 () Bool)

(declare-fun lt!374173 () ListLongMap!8859)

(assert (=> b!826514 (= e!460308 (= lt!374171 (+!1979 (+!1979 lt!374173 (tuple2!10047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374164)))))

(declare-fun b!826515 () Bool)

(assert (=> b!826515 (= e!460303 tp_is_empty!15049)))

(declare-fun b!826516 () Bool)

(assert (=> b!826516 (= e!460307 (= lt!374171 (+!1979 (+!1979 lt!374173 lt!374164) lt!374172)))))

(declare-fun b!826517 () Bool)

(declare-fun res!563472 () Bool)

(assert (=> b!826517 (=> (not res!563472) (not e!460306))))

(assert (=> b!826517 (= res!563472 (and (= (size!22587 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22588 _keys!976) (size!22587 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826510 () Bool)

(assert (=> b!826510 (= e!460306 (not e!460309))))

(declare-fun res!563473 () Bool)

(assert (=> b!826510 (=> res!563473 e!460309)))

(assert (=> b!826510 (= res!563473 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826510 (= lt!374162 lt!374173)))

(declare-fun lt!374167 () Unit!28303)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!570 (array!46243 array!46241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25067 V!25067 V!25067 V!25067 (_ BitVec 32) Int) Unit!28303)

(assert (=> b!826510 (= lt!374167 (lemmaNoChangeToArrayThenSameMapNoExtras!570 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2477 (array!46243 array!46241 (_ BitVec 32) (_ BitVec 32) V!25067 V!25067 (_ BitVec 32) Int) ListLongMap!8859)

(assert (=> b!826510 (= lt!374173 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826510 (= lt!374162 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!563474 () Bool)

(assert (=> start!71152 (=> (not res!563474) (not e!460306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71152 (= res!563474 (validMask!0 mask!1312))))

(assert (=> start!71152 e!460306))

(assert (=> start!71152 tp_is_empty!15049))

(declare-fun array_inv!17735 (array!46243) Bool)

(assert (=> start!71152 (array_inv!17735 _keys!976)))

(assert (=> start!71152 true))

(declare-fun array_inv!17736 (array!46241) Bool)

(assert (=> start!71152 (and (array_inv!17736 _values!788) e!460305)))

(assert (=> start!71152 tp!46776))

(assert (= (and start!71152 res!563474) b!826517))

(assert (= (and b!826517 res!563472) b!826513))

(assert (= (and b!826513 res!563471) b!826512))

(assert (= (and b!826512 res!563475) b!826510))

(assert (= (and b!826510 (not res!563473)) b!826511))

(assert (= (and b!826511 res!563477) b!826514))

(assert (= (and b!826511 res!563476) b!826516))

(assert (= (and b!826509 condMapEmpty!24199) mapIsEmpty!24199))

(assert (= (and b!826509 (not condMapEmpty!24199)) mapNonEmpty!24199))

(get-info :version)

(assert (= (and mapNonEmpty!24199 ((_ is ValueCellFull!7109) mapValue!24199)) b!826508))

(assert (= (and b!826509 ((_ is ValueCellFull!7109) mapDefault!24199)) b!826515))

(assert (= start!71152 b!826509))

(declare-fun m!768931 () Bool)

(assert (=> mapNonEmpty!24199 m!768931))

(declare-fun m!768933 () Bool)

(assert (=> b!826510 m!768933))

(declare-fun m!768935 () Bool)

(assert (=> b!826510 m!768935))

(declare-fun m!768937 () Bool)

(assert (=> b!826510 m!768937))

(declare-fun m!768939 () Bool)

(assert (=> start!71152 m!768939))

(declare-fun m!768941 () Bool)

(assert (=> start!71152 m!768941))

(declare-fun m!768943 () Bool)

(assert (=> start!71152 m!768943))

(declare-fun m!768945 () Bool)

(assert (=> b!826511 m!768945))

(declare-fun m!768947 () Bool)

(assert (=> b!826511 m!768947))

(declare-fun m!768949 () Bool)

(assert (=> b!826511 m!768949))

(declare-fun m!768951 () Bool)

(assert (=> b!826511 m!768951))

(declare-fun m!768953 () Bool)

(assert (=> b!826511 m!768953))

(declare-fun m!768955 () Bool)

(assert (=> b!826511 m!768955))

(declare-fun m!768957 () Bool)

(assert (=> b!826511 m!768957))

(assert (=> b!826511 m!768951))

(declare-fun m!768959 () Bool)

(assert (=> b!826511 m!768959))

(assert (=> b!826511 m!768947))

(declare-fun m!768961 () Bool)

(assert (=> b!826511 m!768961))

(declare-fun m!768963 () Bool)

(assert (=> b!826511 m!768963))

(declare-fun m!768965 () Bool)

(assert (=> b!826511 m!768965))

(declare-fun m!768967 () Bool)

(assert (=> b!826513 m!768967))

(declare-fun m!768969 () Bool)

(assert (=> b!826512 m!768969))

(declare-fun m!768971 () Bool)

(assert (=> b!826514 m!768971))

(assert (=> b!826514 m!768971))

(declare-fun m!768973 () Bool)

(assert (=> b!826514 m!768973))

(declare-fun m!768975 () Bool)

(assert (=> b!826516 m!768975))

(assert (=> b!826516 m!768975))

(declare-fun m!768977 () Bool)

(assert (=> b!826516 m!768977))

(check-sat (not start!71152) (not b!826512) (not b!826516) (not b!826514) (not b_next!13339) (not b!826510) b_and!22239 tp_is_empty!15049 (not b!826511) (not b!826513) (not mapNonEmpty!24199))
(check-sat b_and!22239 (not b_next!13339))
