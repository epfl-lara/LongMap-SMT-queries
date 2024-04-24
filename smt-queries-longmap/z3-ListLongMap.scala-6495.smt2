; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82978 () Bool)

(assert start!82978)

(declare-fun b_free!18937 () Bool)

(declare-fun b_next!18937 () Bool)

(assert (=> start!82978 (= b_free!18937 (not b_next!18937))))

(declare-fun tp!65941 () Bool)

(declare-fun b_and!30435 () Bool)

(assert (=> start!82978 (= tp!65941 b_and!30435)))

(declare-fun mapNonEmpty!34612 () Bool)

(declare-fun mapRes!34612 () Bool)

(declare-fun tp!65940 () Bool)

(declare-fun e!545122 () Bool)

(assert (=> mapNonEmpty!34612 (= mapRes!34612 (and tp!65940 e!545122))))

(declare-datatypes ((V!33977 0))(
  ( (V!33978 (val!10923 Int)) )
))
(declare-datatypes ((ValueCell!10391 0))(
  ( (ValueCellFull!10391 (v!13478 V!33977)) (EmptyCell!10391) )
))
(declare-fun mapValue!34612 () ValueCell!10391)

(declare-datatypes ((array!59588 0))(
  ( (array!59589 (arr!28658 (Array (_ BitVec 32) ValueCell!10391)) (size!29138 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59588)

(declare-fun mapRest!34612 () (Array (_ BitVec 32) ValueCell!10391))

(declare-fun mapKey!34612 () (_ BitVec 32))

(assert (=> mapNonEmpty!34612 (= (arr!28658 _values!1400) (store mapRest!34612 mapKey!34612 mapValue!34612))))

(declare-fun b!966870 () Bool)

(declare-fun res!646933 () Bool)

(declare-fun e!545123 () Bool)

(assert (=> b!966870 (=> (not res!646933) (not e!545123))))

(declare-datatypes ((array!59590 0))(
  ( (array!59591 (arr!28659 (Array (_ BitVec 32) (_ BitVec 64))) (size!29139 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59590)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966870 (= res!646933 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29139 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29139 _keys!1686))))))

(declare-fun b!966871 () Bool)

(declare-fun res!646932 () Bool)

(assert (=> b!966871 (=> (not res!646932) (not e!545123))))

(declare-datatypes ((List!19878 0))(
  ( (Nil!19875) (Cons!19874 (h!21042 (_ BitVec 64)) (t!28233 List!19878)) )
))
(declare-fun arrayNoDuplicates!0 (array!59590 (_ BitVec 32) List!19878) Bool)

(assert (=> b!966871 (= res!646932 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19875))))

(declare-fun b!966872 () Bool)

(declare-fun tp_is_empty!21745 () Bool)

(assert (=> b!966872 (= e!545122 tp_is_empty!21745)))

(declare-fun b!966873 () Bool)

(declare-fun e!545119 () Bool)

(declare-fun e!545121 () Bool)

(assert (=> b!966873 (= e!545119 (and e!545121 mapRes!34612))))

(declare-fun condMapEmpty!34612 () Bool)

(declare-fun mapDefault!34612 () ValueCell!10391)

(assert (=> b!966873 (= condMapEmpty!34612 (= (arr!28658 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10391)) mapDefault!34612)))))

(declare-fun b!966874 () Bool)

(assert (=> b!966874 (= e!545123 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33977)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431642 () Bool)

(declare-fun zeroValue!1342 () V!33977)

(declare-datatypes ((tuple2!14030 0))(
  ( (tuple2!14031 (_1!7026 (_ BitVec 64)) (_2!7026 V!33977)) )
))
(declare-datatypes ((List!19879 0))(
  ( (Nil!19876) (Cons!19875 (h!21043 tuple2!14030) (t!28234 List!19879)) )
))
(declare-datatypes ((ListLongMap!12729 0))(
  ( (ListLongMap!12730 (toList!6380 List!19879)) )
))
(declare-fun contains!5492 (ListLongMap!12729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3613 (array!59590 array!59588 (_ BitVec 32) (_ BitVec 32) V!33977 V!33977 (_ BitVec 32) Int) ListLongMap!12729)

(assert (=> b!966874 (= lt!431642 (contains!5492 (getCurrentListMap!3613 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28659 _keys!1686) i!803)))))

(declare-fun b!966875 () Bool)

(declare-fun res!646934 () Bool)

(assert (=> b!966875 (=> (not res!646934) (not e!545123))))

(assert (=> b!966875 (= res!646934 (and (= (size!29138 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29139 _keys!1686) (size!29138 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34612 () Bool)

(assert (=> mapIsEmpty!34612 mapRes!34612))

(declare-fun b!966869 () Bool)

(assert (=> b!966869 (= e!545121 tp_is_empty!21745)))

(declare-fun res!646935 () Bool)

(assert (=> start!82978 (=> (not res!646935) (not e!545123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82978 (= res!646935 (validMask!0 mask!2110))))

(assert (=> start!82978 e!545123))

(assert (=> start!82978 true))

(declare-fun array_inv!22249 (array!59588) Bool)

(assert (=> start!82978 (and (array_inv!22249 _values!1400) e!545119)))

(declare-fun array_inv!22250 (array!59590) Bool)

(assert (=> start!82978 (array_inv!22250 _keys!1686)))

(assert (=> start!82978 tp!65941))

(assert (=> start!82978 tp_is_empty!21745))

(declare-fun b!966876 () Bool)

(declare-fun res!646930 () Bool)

(assert (=> b!966876 (=> (not res!646930) (not e!545123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966876 (= res!646930 (validKeyInArray!0 (select (arr!28659 _keys!1686) i!803)))))

(declare-fun b!966877 () Bool)

(declare-fun res!646931 () Bool)

(assert (=> b!966877 (=> (not res!646931) (not e!545123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59590 (_ BitVec 32)) Bool)

(assert (=> b!966877 (= res!646931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82978 res!646935) b!966875))

(assert (= (and b!966875 res!646934) b!966877))

(assert (= (and b!966877 res!646931) b!966871))

(assert (= (and b!966871 res!646932) b!966870))

(assert (= (and b!966870 res!646933) b!966876))

(assert (= (and b!966876 res!646930) b!966874))

(assert (= (and b!966873 condMapEmpty!34612) mapIsEmpty!34612))

(assert (= (and b!966873 (not condMapEmpty!34612)) mapNonEmpty!34612))

(get-info :version)

(assert (= (and mapNonEmpty!34612 ((_ is ValueCellFull!10391) mapValue!34612)) b!966872))

(assert (= (and b!966873 ((_ is ValueCellFull!10391) mapDefault!34612)) b!966869))

(assert (= start!82978 b!966873))

(declare-fun m!896173 () Bool)

(assert (=> mapNonEmpty!34612 m!896173))

(declare-fun m!896175 () Bool)

(assert (=> b!966874 m!896175))

(declare-fun m!896177 () Bool)

(assert (=> b!966874 m!896177))

(assert (=> b!966874 m!896175))

(assert (=> b!966874 m!896177))

(declare-fun m!896179 () Bool)

(assert (=> b!966874 m!896179))

(declare-fun m!896181 () Bool)

(assert (=> b!966877 m!896181))

(assert (=> b!966876 m!896177))

(assert (=> b!966876 m!896177))

(declare-fun m!896183 () Bool)

(assert (=> b!966876 m!896183))

(declare-fun m!896185 () Bool)

(assert (=> b!966871 m!896185))

(declare-fun m!896187 () Bool)

(assert (=> start!82978 m!896187))

(declare-fun m!896189 () Bool)

(assert (=> start!82978 m!896189))

(declare-fun m!896191 () Bool)

(assert (=> start!82978 m!896191))

(check-sat (not b!966877) b_and!30435 (not b!966874) (not mapNonEmpty!34612) (not b_next!18937) (not b!966871) (not start!82978) tp_is_empty!21745 (not b!966876))
(check-sat b_and!30435 (not b_next!18937))
