; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82948 () Bool)

(assert start!82948)

(declare-fun b_free!19093 () Bool)

(declare-fun b_next!19093 () Bool)

(assert (=> start!82948 (= b_free!19093 (not b_next!19093))))

(declare-fun tp!66408 () Bool)

(declare-fun b_and!30555 () Bool)

(assert (=> start!82948 (= tp!66408 b_and!30555)))

(declare-fun b!968152 () Bool)

(declare-fun res!648201 () Bool)

(declare-fun e!545580 () Bool)

(assert (=> b!968152 (=> (not res!648201) (not e!545580))))

(declare-datatypes ((array!59802 0))(
  ( (array!59803 (arr!28770 (Array (_ BitVec 32) (_ BitVec 64))) (size!29251 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59802)

(declare-datatypes ((List!20030 0))(
  ( (Nil!20027) (Cons!20026 (h!21188 (_ BitVec 64)) (t!28384 List!20030)) )
))
(declare-fun arrayNoDuplicates!0 (array!59802 (_ BitVec 32) List!20030) Bool)

(assert (=> b!968152 (= res!648201 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!20027))))

(declare-fun b!968153 () Bool)

(declare-fun res!648203 () Bool)

(assert (=> b!968153 (=> (not res!648203) (not e!545580))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968153 (= res!648203 (validKeyInArray!0 (select (arr!28770 _keys!1686) i!803)))))

(declare-fun b!968154 () Bool)

(declare-fun e!545581 () Bool)

(declare-fun tp_is_empty!21901 () Bool)

(assert (=> b!968154 (= e!545581 tp_is_empty!21901)))

(declare-fun b!968155 () Bool)

(declare-fun res!648204 () Bool)

(assert (=> b!968155 (=> (not res!648204) (not e!545580))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968155 (= res!648204 (bvsle from!2084 newFrom!159))))

(declare-fun b!968156 () Bool)

(declare-fun res!648199 () Bool)

(assert (=> b!968156 (=> (not res!648199) (not e!545580))))

(declare-datatypes ((V!34185 0))(
  ( (V!34186 (val!11001 Int)) )
))
(declare-datatypes ((ValueCell!10469 0))(
  ( (ValueCellFull!10469 (v!13558 V!34185)) (EmptyCell!10469) )
))
(declare-datatypes ((array!59804 0))(
  ( (array!59805 (arr!28771 (Array (_ BitVec 32) ValueCell!10469)) (size!29252 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59804)

(declare-fun minValue!1342 () V!34185)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34185)

(declare-datatypes ((tuple2!14232 0))(
  ( (tuple2!14233 (_1!7127 (_ BitVec 64)) (_2!7127 V!34185)) )
))
(declare-datatypes ((List!20031 0))(
  ( (Nil!20028) (Cons!20027 (h!21189 tuple2!14232) (t!28385 List!20031)) )
))
(declare-datatypes ((ListLongMap!12919 0))(
  ( (ListLongMap!12920 (toList!6475 List!20031)) )
))
(declare-fun contains!5520 (ListLongMap!12919 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3637 (array!59802 array!59804 (_ BitVec 32) (_ BitVec 32) V!34185 V!34185 (_ BitVec 32) Int) ListLongMap!12919)

(assert (=> b!968156 (= res!648199 (contains!5520 (getCurrentListMap!3637 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28770 _keys!1686) i!803)))))

(declare-fun b!968157 () Bool)

(declare-fun res!648206 () Bool)

(assert (=> b!968157 (=> (not res!648206) (not e!545580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59802 (_ BitVec 32)) Bool)

(assert (=> b!968157 (= res!648206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!648205 () Bool)

(assert (=> start!82948 (=> (not res!648205) (not e!545580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82948 (= res!648205 (validMask!0 mask!2110))))

(assert (=> start!82948 e!545580))

(assert (=> start!82948 true))

(declare-fun e!545577 () Bool)

(declare-fun array_inv!22337 (array!59804) Bool)

(assert (=> start!82948 (and (array_inv!22337 _values!1400) e!545577)))

(declare-fun array_inv!22338 (array!59802) Bool)

(assert (=> start!82948 (array_inv!22338 _keys!1686)))

(assert (=> start!82948 tp!66408))

(assert (=> start!82948 tp_is_empty!21901))

(declare-fun mapIsEmpty!34846 () Bool)

(declare-fun mapRes!34846 () Bool)

(assert (=> mapIsEmpty!34846 mapRes!34846))

(declare-fun b!968158 () Bool)

(declare-fun e!545579 () Bool)

(assert (=> b!968158 (= e!545579 tp_is_empty!21901)))

(declare-fun mapNonEmpty!34846 () Bool)

(declare-fun tp!66409 () Bool)

(assert (=> mapNonEmpty!34846 (= mapRes!34846 (and tp!66409 e!545579))))

(declare-fun mapRest!34846 () (Array (_ BitVec 32) ValueCell!10469))

(declare-fun mapValue!34846 () ValueCell!10469)

(declare-fun mapKey!34846 () (_ BitVec 32))

(assert (=> mapNonEmpty!34846 (= (arr!28771 _values!1400) (store mapRest!34846 mapKey!34846 mapValue!34846))))

(declare-fun b!968159 () Bool)

(assert (=> b!968159 (= e!545577 (and e!545581 mapRes!34846))))

(declare-fun condMapEmpty!34846 () Bool)

(declare-fun mapDefault!34846 () ValueCell!10469)

(assert (=> b!968159 (= condMapEmpty!34846 (= (arr!28771 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10469)) mapDefault!34846)))))

(declare-fun b!968160 () Bool)

(assert (=> b!968160 (= e!545580 (not (contains!5520 (getCurrentListMap!3637 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28770 _keys!1686) i!803))))))

(declare-fun b!968161 () Bool)

(declare-fun res!648202 () Bool)

(assert (=> b!968161 (=> (not res!648202) (not e!545580))))

(assert (=> b!968161 (= res!648202 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29251 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29251 _keys!1686))))))

(declare-fun b!968162 () Bool)

(declare-fun res!648200 () Bool)

(assert (=> b!968162 (=> (not res!648200) (not e!545580))))

(assert (=> b!968162 (= res!648200 (and (= (size!29252 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29251 _keys!1686) (size!29252 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82948 res!648205) b!968162))

(assert (= (and b!968162 res!648200) b!968157))

(assert (= (and b!968157 res!648206) b!968152))

(assert (= (and b!968152 res!648201) b!968161))

(assert (= (and b!968161 res!648202) b!968153))

(assert (= (and b!968153 res!648203) b!968156))

(assert (= (and b!968156 res!648199) b!968155))

(assert (= (and b!968155 res!648204) b!968160))

(assert (= (and b!968159 condMapEmpty!34846) mapIsEmpty!34846))

(assert (= (and b!968159 (not condMapEmpty!34846)) mapNonEmpty!34846))

(get-info :version)

(assert (= (and mapNonEmpty!34846 ((_ is ValueCellFull!10469) mapValue!34846)) b!968158))

(assert (= (and b!968159 ((_ is ValueCellFull!10469) mapDefault!34846)) b!968154))

(assert (= start!82948 b!968159))

(declare-fun m!895993 () Bool)

(assert (=> b!968156 m!895993))

(declare-fun m!895995 () Bool)

(assert (=> b!968156 m!895995))

(assert (=> b!968156 m!895993))

(assert (=> b!968156 m!895995))

(declare-fun m!895997 () Bool)

(assert (=> b!968156 m!895997))

(declare-fun m!895999 () Bool)

(assert (=> b!968152 m!895999))

(declare-fun m!896001 () Bool)

(assert (=> b!968160 m!896001))

(assert (=> b!968160 m!895995))

(assert (=> b!968160 m!896001))

(assert (=> b!968160 m!895995))

(declare-fun m!896003 () Bool)

(assert (=> b!968160 m!896003))

(declare-fun m!896005 () Bool)

(assert (=> start!82948 m!896005))

(declare-fun m!896007 () Bool)

(assert (=> start!82948 m!896007))

(declare-fun m!896009 () Bool)

(assert (=> start!82948 m!896009))

(assert (=> b!968153 m!895995))

(assert (=> b!968153 m!895995))

(declare-fun m!896011 () Bool)

(assert (=> b!968153 m!896011))

(declare-fun m!896013 () Bool)

(assert (=> b!968157 m!896013))

(declare-fun m!896015 () Bool)

(assert (=> mapNonEmpty!34846 m!896015))

(check-sat (not b!968152) (not start!82948) (not b!968157) (not b!968153) (not b!968156) b_and!30555 (not mapNonEmpty!34846) (not b!968160) tp_is_empty!21901 (not b_next!19093))
(check-sat b_and!30555 (not b_next!19093))
