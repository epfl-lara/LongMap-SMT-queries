; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82956 () Bool)

(assert start!82956)

(declare-fun b_free!19083 () Bool)

(declare-fun b_next!19083 () Bool)

(assert (=> start!82956 (= b_free!19083 (not b_next!19083))))

(declare-fun tp!66377 () Bool)

(declare-fun b_and!30571 () Bool)

(assert (=> start!82956 (= tp!66377 b_and!30571)))

(declare-fun b!968222 () Bool)

(declare-fun e!545648 () Bool)

(assert (=> b!968222 (= e!545648 true)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34171 0))(
  ( (V!34172 (val!10996 Int)) )
))
(declare-datatypes ((ValueCell!10464 0))(
  ( (ValueCellFull!10464 (v!13554 V!34171)) (EmptyCell!10464) )
))
(declare-datatypes ((array!59853 0))(
  ( (array!59854 (arr!28795 (Array (_ BitVec 32) ValueCell!10464)) (size!29274 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59853)

(declare-datatypes ((array!59855 0))(
  ( (array!59856 (arr!28796 (Array (_ BitVec 32) (_ BitVec 64))) (size!29275 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59855)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34171)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34171)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-datatypes ((tuple2!14148 0))(
  ( (tuple2!14149 (_1!7085 (_ BitVec 64)) (_2!7085 V!34171)) )
))
(declare-datatypes ((List!19994 0))(
  ( (Nil!19991) (Cons!19990 (h!21152 tuple2!14148) (t!28357 List!19994)) )
))
(declare-datatypes ((ListLongMap!12845 0))(
  ( (ListLongMap!12846 (toList!6438 List!19994)) )
))
(declare-fun contains!5539 (ListLongMap!12845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3671 (array!59855 array!59853 (_ BitVec 32) (_ BitVec 32) V!34171 V!34171 (_ BitVec 32) Int) ListLongMap!12845)

(assert (=> b!968222 (contains!5539 (getCurrentListMap!3671 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28796 _keys!1686) i!803))))

(declare-datatypes ((Unit!32357 0))(
  ( (Unit!32358) )
))
(declare-fun lt!431506 () Unit!32357)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!42 (array!59855 array!59853 (_ BitVec 32) (_ BitVec 32) V!34171 V!34171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32357)

(assert (=> b!968222 (= lt!431506 (lemmaInListMapFromThenInFromSmaller!42 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!968223 () Bool)

(declare-fun res!648191 () Bool)

(declare-fun e!545649 () Bool)

(assert (=> b!968223 (=> (not res!648191) (not e!545649))))

(assert (=> b!968223 (= res!648191 (contains!5539 (getCurrentListMap!3671 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28796 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34831 () Bool)

(declare-fun mapRes!34831 () Bool)

(declare-fun tp!66378 () Bool)

(declare-fun e!545650 () Bool)

(assert (=> mapNonEmpty!34831 (= mapRes!34831 (and tp!66378 e!545650))))

(declare-fun mapValue!34831 () ValueCell!10464)

(declare-fun mapKey!34831 () (_ BitVec 32))

(declare-fun mapRest!34831 () (Array (_ BitVec 32) ValueCell!10464))

(assert (=> mapNonEmpty!34831 (= (arr!28795 _values!1400) (store mapRest!34831 mapKey!34831 mapValue!34831))))

(declare-fun b!968225 () Bool)

(declare-fun res!648188 () Bool)

(assert (=> b!968225 (=> (not res!648188) (not e!545649))))

(assert (=> b!968225 (= res!648188 (and (= (size!29274 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29275 _keys!1686) (size!29274 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968226 () Bool)

(declare-fun res!648185 () Bool)

(assert (=> b!968226 (=> (not res!648185) (not e!545649))))

(declare-datatypes ((List!19995 0))(
  ( (Nil!19992) (Cons!19991 (h!21153 (_ BitVec 64)) (t!28358 List!19995)) )
))
(declare-fun arrayNoDuplicates!0 (array!59855 (_ BitVec 32) List!19995) Bool)

(assert (=> b!968226 (= res!648185 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19992))))

(declare-fun b!968227 () Bool)

(declare-fun e!545651 () Bool)

(declare-fun e!545646 () Bool)

(assert (=> b!968227 (= e!545651 (and e!545646 mapRes!34831))))

(declare-fun condMapEmpty!34831 () Bool)

(declare-fun mapDefault!34831 () ValueCell!10464)

(assert (=> b!968227 (= condMapEmpty!34831 (= (arr!28795 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10464)) mapDefault!34831)))))

(declare-fun b!968228 () Bool)

(declare-fun tp_is_empty!21891 () Bool)

(assert (=> b!968228 (= e!545650 tp_is_empty!21891)))

(declare-fun b!968229 () Bool)

(assert (=> b!968229 (= e!545649 (not e!545648))))

(declare-fun res!648187 () Bool)

(assert (=> b!968229 (=> res!648187 e!545648)))

(assert (=> b!968229 (= res!648187 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29275 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!968229 (contains!5539 (getCurrentListMap!3671 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28796 _keys!1686) i!803))))

(declare-fun lt!431505 () Unit!32357)

(declare-fun lemmaInListMapFromThenInFromMinusOne!72 (array!59855 array!59853 (_ BitVec 32) (_ BitVec 32) V!34171 V!34171 (_ BitVec 32) (_ BitVec 32) Int) Unit!32357)

(assert (=> b!968229 (= lt!431505 (lemmaInListMapFromThenInFromMinusOne!72 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968230 () Bool)

(declare-fun res!648190 () Bool)

(assert (=> b!968230 (=> (not res!648190) (not e!545649))))

(assert (=> b!968230 (= res!648190 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34831 () Bool)

(assert (=> mapIsEmpty!34831 mapRes!34831))

(declare-fun b!968231 () Bool)

(assert (=> b!968231 (= e!545646 tp_is_empty!21891)))

(declare-fun res!648186 () Bool)

(assert (=> start!82956 (=> (not res!648186) (not e!545649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82956 (= res!648186 (validMask!0 mask!2110))))

(assert (=> start!82956 e!545649))

(assert (=> start!82956 true))

(declare-fun array_inv!22293 (array!59853) Bool)

(assert (=> start!82956 (and (array_inv!22293 _values!1400) e!545651)))

(declare-fun array_inv!22294 (array!59855) Bool)

(assert (=> start!82956 (array_inv!22294 _keys!1686)))

(assert (=> start!82956 tp!66377))

(assert (=> start!82956 tp_is_empty!21891))

(declare-fun b!968224 () Bool)

(declare-fun res!648189 () Bool)

(assert (=> b!968224 (=> (not res!648189) (not e!545649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59855 (_ BitVec 32)) Bool)

(assert (=> b!968224 (= res!648189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968232 () Bool)

(declare-fun res!648193 () Bool)

(assert (=> b!968232 (=> (not res!648193) (not e!545649))))

(assert (=> b!968232 (= res!648193 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29275 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29275 _keys!1686))))))

(declare-fun b!968233 () Bool)

(declare-fun res!648192 () Bool)

(assert (=> b!968233 (=> (not res!648192) (not e!545649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968233 (= res!648192 (validKeyInArray!0 (select (arr!28796 _keys!1686) i!803)))))

(assert (= (and start!82956 res!648186) b!968225))

(assert (= (and b!968225 res!648188) b!968224))

(assert (= (and b!968224 res!648189) b!968226))

(assert (= (and b!968226 res!648185) b!968232))

(assert (= (and b!968232 res!648193) b!968233))

(assert (= (and b!968233 res!648192) b!968223))

(assert (= (and b!968223 res!648191) b!968230))

(assert (= (and b!968230 res!648190) b!968229))

(assert (= (and b!968229 (not res!648187)) b!968222))

(assert (= (and b!968227 condMapEmpty!34831) mapIsEmpty!34831))

(assert (= (and b!968227 (not condMapEmpty!34831)) mapNonEmpty!34831))

(get-info :version)

(assert (= (and mapNonEmpty!34831 ((_ is ValueCellFull!10464) mapValue!34831)) b!968228))

(assert (= (and b!968227 ((_ is ValueCellFull!10464) mapDefault!34831)) b!968231))

(assert (= start!82956 b!968227))

(declare-fun m!896621 () Bool)

(assert (=> b!968223 m!896621))

(declare-fun m!896623 () Bool)

(assert (=> b!968223 m!896623))

(assert (=> b!968223 m!896621))

(assert (=> b!968223 m!896623))

(declare-fun m!896625 () Bool)

(assert (=> b!968223 m!896625))

(declare-fun m!896627 () Bool)

(assert (=> b!968222 m!896627))

(assert (=> b!968222 m!896623))

(assert (=> b!968222 m!896627))

(assert (=> b!968222 m!896623))

(declare-fun m!896629 () Bool)

(assert (=> b!968222 m!896629))

(declare-fun m!896631 () Bool)

(assert (=> b!968222 m!896631))

(declare-fun m!896633 () Bool)

(assert (=> mapNonEmpty!34831 m!896633))

(assert (=> b!968233 m!896623))

(assert (=> b!968233 m!896623))

(declare-fun m!896635 () Bool)

(assert (=> b!968233 m!896635))

(declare-fun m!896637 () Bool)

(assert (=> b!968226 m!896637))

(declare-fun m!896639 () Bool)

(assert (=> b!968224 m!896639))

(declare-fun m!896641 () Bool)

(assert (=> start!82956 m!896641))

(declare-fun m!896643 () Bool)

(assert (=> start!82956 m!896643))

(declare-fun m!896645 () Bool)

(assert (=> start!82956 m!896645))

(declare-fun m!896647 () Bool)

(assert (=> b!968229 m!896647))

(assert (=> b!968229 m!896623))

(assert (=> b!968229 m!896647))

(assert (=> b!968229 m!896623))

(declare-fun m!896649 () Bool)

(assert (=> b!968229 m!896649))

(declare-fun m!896651 () Bool)

(assert (=> b!968229 m!896651))

(check-sat (not b!968233) (not b!968222) (not b!968226) (not b!968224) (not start!82956) (not b!968229) b_and!30571 (not b!968223) tp_is_empty!21891 (not b_next!19083) (not mapNonEmpty!34831))
(check-sat b_and!30571 (not b_next!19083))
