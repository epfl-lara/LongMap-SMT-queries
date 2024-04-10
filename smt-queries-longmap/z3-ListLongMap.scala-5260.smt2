; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70696 () Bool)

(assert start!70696)

(declare-fun b_free!12969 () Bool)

(declare-fun b_next!12969 () Bool)

(assert (=> start!70696 (= b_free!12969 (not b_next!12969))))

(declare-fun tp!45648 () Bool)

(declare-fun b_and!21831 () Bool)

(assert (=> start!70696 (= tp!45648 b_and!21831)))

(declare-fun b!821145 () Bool)

(declare-fun res!560173 () Bool)

(declare-fun e!456304 () Bool)

(assert (=> b!821145 (=> (not res!560173) (not e!456304))))

(declare-datatypes ((array!45554 0))(
  ( (array!45555 (arr!21828 (Array (_ BitVec 32) (_ BitVec 64))) (size!22249 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45554)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45554 (_ BitVec 32)) Bool)

(assert (=> b!821145 (= res!560173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560174 () Bool)

(assert (=> start!70696 (=> (not res!560174) (not e!456304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70696 (= res!560174 (validMask!0 mask!1312))))

(assert (=> start!70696 e!456304))

(declare-fun tp_is_empty!14679 () Bool)

(assert (=> start!70696 tp_is_empty!14679))

(declare-fun array_inv!17447 (array!45554) Bool)

(assert (=> start!70696 (array_inv!17447 _keys!976)))

(assert (=> start!70696 true))

(declare-datatypes ((V!24573 0))(
  ( (V!24574 (val!7387 Int)) )
))
(declare-datatypes ((ValueCell!6924 0))(
  ( (ValueCellFull!6924 (v!9818 V!24573)) (EmptyCell!6924) )
))
(declare-datatypes ((array!45556 0))(
  ( (array!45557 (arr!21829 (Array (_ BitVec 32) ValueCell!6924)) (size!22250 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45556)

(declare-fun e!456307 () Bool)

(declare-fun array_inv!17448 (array!45556) Bool)

(assert (=> start!70696 (and (array_inv!17448 _values!788) e!456307)))

(assert (=> start!70696 tp!45648))

(declare-fun b!821146 () Bool)

(declare-fun e!456308 () Bool)

(assert (=> b!821146 (= e!456308 tp_is_empty!14679)))

(declare-fun mapIsEmpty!23626 () Bool)

(declare-fun mapRes!23626 () Bool)

(assert (=> mapIsEmpty!23626 mapRes!23626))

(declare-fun mapNonEmpty!23626 () Bool)

(declare-fun tp!45649 () Bool)

(assert (=> mapNonEmpty!23626 (= mapRes!23626 (and tp!45649 e!456308))))

(declare-fun mapKey!23626 () (_ BitVec 32))

(declare-fun mapRest!23626 () (Array (_ BitVec 32) ValueCell!6924))

(declare-fun mapValue!23626 () ValueCell!6924)

(assert (=> mapNonEmpty!23626 (= (arr!21829 _values!788) (store mapRest!23626 mapKey!23626 mapValue!23626))))

(declare-fun b!821147 () Bool)

(declare-fun e!456303 () Bool)

(assert (=> b!821147 (= e!456303 true)))

(declare-fun zeroValueBefore!34 () V!24573)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24573)

(declare-datatypes ((tuple2!9742 0))(
  ( (tuple2!9743 (_1!4882 (_ BitVec 64)) (_2!4882 V!24573)) )
))
(declare-datatypes ((List!15561 0))(
  ( (Nil!15558) (Cons!15557 (h!16686 tuple2!9742) (t!21896 List!15561)) )
))
(declare-datatypes ((ListLongMap!8565 0))(
  ( (ListLongMap!8566 (toList!4298 List!15561)) )
))
(declare-fun lt!369076 () ListLongMap!8565)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2470 (array!45554 array!45556 (_ BitVec 32) (_ BitVec 32) V!24573 V!24573 (_ BitVec 32) Int) ListLongMap!8565)

(assert (=> b!821147 (= lt!369076 (getCurrentListMap!2470 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821148 () Bool)

(declare-fun e!456306 () Bool)

(assert (=> b!821148 (= e!456306 tp_is_empty!14679)))

(declare-fun b!821149 () Bool)

(assert (=> b!821149 (= e!456307 (and e!456306 mapRes!23626))))

(declare-fun condMapEmpty!23626 () Bool)

(declare-fun mapDefault!23626 () ValueCell!6924)

(assert (=> b!821149 (= condMapEmpty!23626 (= (arr!21829 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6924)) mapDefault!23626)))))

(declare-fun b!821150 () Bool)

(assert (=> b!821150 (= e!456304 (not e!456303))))

(declare-fun res!560176 () Bool)

(assert (=> b!821150 (=> res!560176 e!456303)))

(assert (=> b!821150 (= res!560176 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369077 () ListLongMap!8565)

(declare-fun lt!369074 () ListLongMap!8565)

(assert (=> b!821150 (= lt!369077 lt!369074)))

(declare-fun zeroValueAfter!34 () V!24573)

(declare-datatypes ((Unit!28073 0))(
  ( (Unit!28074) )
))
(declare-fun lt!369075 () Unit!28073)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!434 (array!45554 array!45556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24573 V!24573 V!24573 V!24573 (_ BitVec 32) Int) Unit!28073)

(assert (=> b!821150 (= lt!369075 (lemmaNoChangeToArrayThenSameMapNoExtras!434 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2324 (array!45554 array!45556 (_ BitVec 32) (_ BitVec 32) V!24573 V!24573 (_ BitVec 32) Int) ListLongMap!8565)

(assert (=> b!821150 (= lt!369074 (getCurrentListMapNoExtraKeys!2324 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821150 (= lt!369077 (getCurrentListMapNoExtraKeys!2324 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821151 () Bool)

(declare-fun res!560177 () Bool)

(assert (=> b!821151 (=> (not res!560177) (not e!456304))))

(assert (=> b!821151 (= res!560177 (and (= (size!22250 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22249 _keys!976) (size!22250 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821152 () Bool)

(declare-fun res!560175 () Bool)

(assert (=> b!821152 (=> (not res!560175) (not e!456304))))

(declare-datatypes ((List!15562 0))(
  ( (Nil!15559) (Cons!15558 (h!16687 (_ BitVec 64)) (t!21897 List!15562)) )
))
(declare-fun arrayNoDuplicates!0 (array!45554 (_ BitVec 32) List!15562) Bool)

(assert (=> b!821152 (= res!560175 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15559))))

(assert (= (and start!70696 res!560174) b!821151))

(assert (= (and b!821151 res!560177) b!821145))

(assert (= (and b!821145 res!560173) b!821152))

(assert (= (and b!821152 res!560175) b!821150))

(assert (= (and b!821150 (not res!560176)) b!821147))

(assert (= (and b!821149 condMapEmpty!23626) mapIsEmpty!23626))

(assert (= (and b!821149 (not condMapEmpty!23626)) mapNonEmpty!23626))

(get-info :version)

(assert (= (and mapNonEmpty!23626 ((_ is ValueCellFull!6924) mapValue!23626)) b!821146))

(assert (= (and b!821149 ((_ is ValueCellFull!6924) mapDefault!23626)) b!821148))

(assert (= start!70696 b!821149))

(declare-fun m!762989 () Bool)

(assert (=> b!821150 m!762989))

(declare-fun m!762991 () Bool)

(assert (=> b!821150 m!762991))

(declare-fun m!762993 () Bool)

(assert (=> b!821150 m!762993))

(declare-fun m!762995 () Bool)

(assert (=> mapNonEmpty!23626 m!762995))

(declare-fun m!762997 () Bool)

(assert (=> b!821147 m!762997))

(declare-fun m!762999 () Bool)

(assert (=> start!70696 m!762999))

(declare-fun m!763001 () Bool)

(assert (=> start!70696 m!763001))

(declare-fun m!763003 () Bool)

(assert (=> start!70696 m!763003))

(declare-fun m!763005 () Bool)

(assert (=> b!821145 m!763005))

(declare-fun m!763007 () Bool)

(assert (=> b!821152 m!763007))

(check-sat (not b!821145) (not b!821150) (not start!70696) (not mapNonEmpty!23626) (not b!821147) (not b_next!12969) b_and!21831 (not b!821152) tp_is_empty!14679)
(check-sat b_and!21831 (not b_next!12969))
