; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69986 () Bool)

(assert start!69986)

(declare-fun b_free!12427 () Bool)

(declare-fun b_next!12427 () Bool)

(assert (=> start!69986 (= b_free!12427 (not b_next!12427))))

(declare-fun tp!43996 () Bool)

(declare-fun b_and!21173 () Bool)

(assert (=> start!69986 (= tp!43996 b_and!21173)))

(declare-fun b!813392 () Bool)

(declare-fun e!450738 () Bool)

(assert (=> b!813392 (= e!450738 false)))

(declare-datatypes ((V!23851 0))(
  ( (V!23852 (val!7116 Int)) )
))
(declare-fun zeroValueAfter!34 () V!23851)

(declare-datatypes ((ValueCell!6653 0))(
  ( (ValueCellFull!6653 (v!9537 V!23851)) (EmptyCell!6653) )
))
(declare-datatypes ((array!44483 0))(
  ( (array!44484 (arr!21302 (Array (_ BitVec 32) ValueCell!6653)) (size!21723 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44483)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!44485 0))(
  ( (array!44486 (arr!21303 (Array (_ BitVec 32) (_ BitVec 64))) (size!21724 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44485)

(declare-fun minValue!754 () V!23851)

(declare-datatypes ((tuple2!9364 0))(
  ( (tuple2!9365 (_1!4693 (_ BitVec 64)) (_2!4693 V!23851)) )
))
(declare-datatypes ((List!15190 0))(
  ( (Nil!15187) (Cons!15186 (h!16315 tuple2!9364) (t!21498 List!15190)) )
))
(declare-datatypes ((ListLongMap!8177 0))(
  ( (ListLongMap!8178 (toList!4104 List!15190)) )
))
(declare-fun lt!364109 () ListLongMap!8177)

(declare-fun getCurrentListMapNoExtraKeys!2169 (array!44485 array!44483 (_ BitVec 32) (_ BitVec 32) V!23851 V!23851 (_ BitVec 32) Int) ListLongMap!8177)

(assert (=> b!813392 (= lt!364109 (getCurrentListMapNoExtraKeys!2169 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23851)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364110 () ListLongMap!8177)

(assert (=> b!813392 (= lt!364110 (getCurrentListMapNoExtraKeys!2169 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813393 () Bool)

(declare-fun e!450736 () Bool)

(declare-fun e!450734 () Bool)

(declare-fun mapRes!22786 () Bool)

(assert (=> b!813393 (= e!450736 (and e!450734 mapRes!22786))))

(declare-fun condMapEmpty!22786 () Bool)

(declare-fun mapDefault!22786 () ValueCell!6653)

(assert (=> b!813393 (= condMapEmpty!22786 (= (arr!21302 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6653)) mapDefault!22786)))))

(declare-fun mapNonEmpty!22786 () Bool)

(declare-fun tp!43995 () Bool)

(declare-fun e!450735 () Bool)

(assert (=> mapNonEmpty!22786 (= mapRes!22786 (and tp!43995 e!450735))))

(declare-fun mapKey!22786 () (_ BitVec 32))

(declare-fun mapRest!22786 () (Array (_ BitVec 32) ValueCell!6653))

(declare-fun mapValue!22786 () ValueCell!6653)

(assert (=> mapNonEmpty!22786 (= (arr!21302 _values!788) (store mapRest!22786 mapKey!22786 mapValue!22786))))

(declare-fun b!813394 () Bool)

(declare-fun res!555713 () Bool)

(assert (=> b!813394 (=> (not res!555713) (not e!450738))))

(declare-datatypes ((List!15191 0))(
  ( (Nil!15188) (Cons!15187 (h!16316 (_ BitVec 64)) (t!21499 List!15191)) )
))
(declare-fun arrayNoDuplicates!0 (array!44485 (_ BitVec 32) List!15191) Bool)

(assert (=> b!813394 (= res!555713 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15188))))

(declare-fun b!813395 () Bool)

(declare-fun res!555715 () Bool)

(assert (=> b!813395 (=> (not res!555715) (not e!450738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44485 (_ BitVec 32)) Bool)

(assert (=> b!813395 (= res!555715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813396 () Bool)

(declare-fun tp_is_empty!14137 () Bool)

(assert (=> b!813396 (= e!450735 tp_is_empty!14137)))

(declare-fun b!813397 () Bool)

(assert (=> b!813397 (= e!450734 tp_is_empty!14137)))

(declare-fun b!813398 () Bool)

(declare-fun res!555714 () Bool)

(assert (=> b!813398 (=> (not res!555714) (not e!450738))))

(assert (=> b!813398 (= res!555714 (and (= (size!21723 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21724 _keys!976) (size!21723 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22786 () Bool)

(assert (=> mapIsEmpty!22786 mapRes!22786))

(declare-fun res!555716 () Bool)

(assert (=> start!69986 (=> (not res!555716) (not e!450738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69986 (= res!555716 (validMask!0 mask!1312))))

(assert (=> start!69986 e!450738))

(assert (=> start!69986 tp_is_empty!14137))

(declare-fun array_inv!17141 (array!44485) Bool)

(assert (=> start!69986 (array_inv!17141 _keys!976)))

(assert (=> start!69986 true))

(declare-fun array_inv!17142 (array!44483) Bool)

(assert (=> start!69986 (and (array_inv!17142 _values!788) e!450736)))

(assert (=> start!69986 tp!43996))

(assert (= (and start!69986 res!555716) b!813398))

(assert (= (and b!813398 res!555714) b!813395))

(assert (= (and b!813395 res!555715) b!813394))

(assert (= (and b!813394 res!555713) b!813392))

(assert (= (and b!813393 condMapEmpty!22786) mapIsEmpty!22786))

(assert (= (and b!813393 (not condMapEmpty!22786)) mapNonEmpty!22786))

(get-info :version)

(assert (= (and mapNonEmpty!22786 ((_ is ValueCellFull!6653) mapValue!22786)) b!813396))

(assert (= (and b!813393 ((_ is ValueCellFull!6653) mapDefault!22786)) b!813397))

(assert (= start!69986 b!813393))

(declare-fun m!754869 () Bool)

(assert (=> b!813395 m!754869))

(declare-fun m!754871 () Bool)

(assert (=> start!69986 m!754871))

(declare-fun m!754873 () Bool)

(assert (=> start!69986 m!754873))

(declare-fun m!754875 () Bool)

(assert (=> start!69986 m!754875))

(declare-fun m!754877 () Bool)

(assert (=> mapNonEmpty!22786 m!754877))

(declare-fun m!754879 () Bool)

(assert (=> b!813394 m!754879))

(declare-fun m!754881 () Bool)

(assert (=> b!813392 m!754881))

(declare-fun m!754883 () Bool)

(assert (=> b!813392 m!754883))

(check-sat (not b!813394) (not b_next!12427) tp_is_empty!14137 (not b!813392) (not b!813395) b_and!21173 (not start!69986) (not mapNonEmpty!22786))
(check-sat b_and!21173 (not b_next!12427))
