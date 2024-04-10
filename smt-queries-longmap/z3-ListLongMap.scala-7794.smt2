; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97510 () Bool)

(assert start!97510)

(declare-fun b!1113183 () Bool)

(declare-fun res!742933 () Bool)

(declare-fun e!634591 () Bool)

(assert (=> b!1113183 (=> (not res!742933) (not e!634591))))

(declare-datatypes ((array!72391 0))(
  ( (array!72392 (arr!34848 (Array (_ BitVec 32) (_ BitVec 64))) (size!35384 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72391)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42115 0))(
  ( (V!42116 (val!13927 Int)) )
))
(declare-datatypes ((ValueCell!13161 0))(
  ( (ValueCellFull!13161 (v!16560 V!42115)) (EmptyCell!13161) )
))
(declare-datatypes ((array!72393 0))(
  ( (array!72394 (arr!34849 (Array (_ BitVec 32) ValueCell!13161)) (size!35385 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72393)

(assert (=> b!1113183 (= res!742933 (and (= (size!35385 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35384 _keys!1208) (size!35385 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!742941 () Bool)

(assert (=> start!97510 (=> (not res!742941) (not e!634591))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97510 (= res!742941 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35384 _keys!1208))))))

(assert (=> start!97510 e!634591))

(declare-fun array_inv!26794 (array!72391) Bool)

(assert (=> start!97510 (array_inv!26794 _keys!1208)))

(assert (=> start!97510 true))

(declare-fun e!634593 () Bool)

(declare-fun array_inv!26795 (array!72393) Bool)

(assert (=> start!97510 (and (array_inv!26795 _values!996) e!634593)))

(declare-fun b!1113184 () Bool)

(declare-fun res!742942 () Bool)

(declare-fun e!634589 () Bool)

(assert (=> b!1113184 (=> (not res!742942) (not e!634589))))

(declare-fun lt!496633 () array!72391)

(declare-datatypes ((List!24306 0))(
  ( (Nil!24303) (Cons!24302 (h!25511 (_ BitVec 64)) (t!34787 List!24306)) )
))
(declare-fun arrayNoDuplicates!0 (array!72391 (_ BitVec 32) List!24306) Bool)

(assert (=> b!1113184 (= res!742942 (arrayNoDuplicates!0 lt!496633 #b00000000000000000000000000000000 Nil!24303))))

(declare-fun b!1113185 () Bool)

(declare-fun res!742940 () Bool)

(assert (=> b!1113185 (=> (not res!742940) (not e!634591))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1113185 (= res!742940 (= (select (arr!34848 _keys!1208) i!673) k0!934))))

(declare-fun b!1113186 () Bool)

(assert (=> b!1113186 (= e!634589 (not true))))

(declare-fun arrayContainsKey!0 (array!72391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113186 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36526 0))(
  ( (Unit!36527) )
))
(declare-fun lt!496634 () Unit!36526)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72391 (_ BitVec 64) (_ BitVec 32)) Unit!36526)

(assert (=> b!1113186 (= lt!496634 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113187 () Bool)

(declare-fun res!742936 () Bool)

(assert (=> b!1113187 (=> (not res!742936) (not e!634591))))

(assert (=> b!1113187 (= res!742936 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35384 _keys!1208))))))

(declare-fun b!1113188 () Bool)

(assert (=> b!1113188 (= e!634591 e!634589)))

(declare-fun res!742938 () Bool)

(assert (=> b!1113188 (=> (not res!742938) (not e!634589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72391 (_ BitVec 32)) Bool)

(assert (=> b!1113188 (= res!742938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496633 mask!1564))))

(assert (=> b!1113188 (= lt!496633 (array!72392 (store (arr!34848 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35384 _keys!1208)))))

(declare-fun b!1113189 () Bool)

(declare-fun e!634588 () Bool)

(declare-fun mapRes!43429 () Bool)

(assert (=> b!1113189 (= e!634593 (and e!634588 mapRes!43429))))

(declare-fun condMapEmpty!43429 () Bool)

(declare-fun mapDefault!43429 () ValueCell!13161)

(assert (=> b!1113189 (= condMapEmpty!43429 (= (arr!34849 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13161)) mapDefault!43429)))))

(declare-fun b!1113190 () Bool)

(declare-fun tp_is_empty!27741 () Bool)

(assert (=> b!1113190 (= e!634588 tp_is_empty!27741)))

(declare-fun b!1113191 () Bool)

(declare-fun res!742934 () Bool)

(assert (=> b!1113191 (=> (not res!742934) (not e!634591))))

(assert (=> b!1113191 (= res!742934 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24303))))

(declare-fun b!1113192 () Bool)

(declare-fun e!634590 () Bool)

(assert (=> b!1113192 (= e!634590 tp_is_empty!27741)))

(declare-fun b!1113193 () Bool)

(declare-fun res!742939 () Bool)

(assert (=> b!1113193 (=> (not res!742939) (not e!634591))))

(assert (=> b!1113193 (= res!742939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43429 () Bool)

(declare-fun tp!82673 () Bool)

(assert (=> mapNonEmpty!43429 (= mapRes!43429 (and tp!82673 e!634590))))

(declare-fun mapValue!43429 () ValueCell!13161)

(declare-fun mapKey!43429 () (_ BitVec 32))

(declare-fun mapRest!43429 () (Array (_ BitVec 32) ValueCell!13161))

(assert (=> mapNonEmpty!43429 (= (arr!34849 _values!996) (store mapRest!43429 mapKey!43429 mapValue!43429))))

(declare-fun mapIsEmpty!43429 () Bool)

(assert (=> mapIsEmpty!43429 mapRes!43429))

(declare-fun b!1113194 () Bool)

(declare-fun res!742935 () Bool)

(assert (=> b!1113194 (=> (not res!742935) (not e!634591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113194 (= res!742935 (validMask!0 mask!1564))))

(declare-fun b!1113195 () Bool)

(declare-fun res!742937 () Bool)

(assert (=> b!1113195 (=> (not res!742937) (not e!634591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113195 (= res!742937 (validKeyInArray!0 k0!934))))

(assert (= (and start!97510 res!742941) b!1113194))

(assert (= (and b!1113194 res!742935) b!1113183))

(assert (= (and b!1113183 res!742933) b!1113193))

(assert (= (and b!1113193 res!742939) b!1113191))

(assert (= (and b!1113191 res!742934) b!1113187))

(assert (= (and b!1113187 res!742936) b!1113195))

(assert (= (and b!1113195 res!742937) b!1113185))

(assert (= (and b!1113185 res!742940) b!1113188))

(assert (= (and b!1113188 res!742938) b!1113184))

(assert (= (and b!1113184 res!742942) b!1113186))

(assert (= (and b!1113189 condMapEmpty!43429) mapIsEmpty!43429))

(assert (= (and b!1113189 (not condMapEmpty!43429)) mapNonEmpty!43429))

(get-info :version)

(assert (= (and mapNonEmpty!43429 ((_ is ValueCellFull!13161) mapValue!43429)) b!1113192))

(assert (= (and b!1113189 ((_ is ValueCellFull!13161) mapDefault!43429)) b!1113190))

(assert (= start!97510 b!1113189))

(declare-fun m!1030477 () Bool)

(assert (=> start!97510 m!1030477))

(declare-fun m!1030479 () Bool)

(assert (=> start!97510 m!1030479))

(declare-fun m!1030481 () Bool)

(assert (=> b!1113193 m!1030481))

(declare-fun m!1030483 () Bool)

(assert (=> b!1113185 m!1030483))

(declare-fun m!1030485 () Bool)

(assert (=> mapNonEmpty!43429 m!1030485))

(declare-fun m!1030487 () Bool)

(assert (=> b!1113188 m!1030487))

(declare-fun m!1030489 () Bool)

(assert (=> b!1113188 m!1030489))

(declare-fun m!1030491 () Bool)

(assert (=> b!1113195 m!1030491))

(declare-fun m!1030493 () Bool)

(assert (=> b!1113191 m!1030493))

(declare-fun m!1030495 () Bool)

(assert (=> b!1113194 m!1030495))

(declare-fun m!1030497 () Bool)

(assert (=> b!1113186 m!1030497))

(declare-fun m!1030499 () Bool)

(assert (=> b!1113186 m!1030499))

(declare-fun m!1030501 () Bool)

(assert (=> b!1113184 m!1030501))

(check-sat (not b!1113194) (not b!1113186) (not b!1113193) (not b!1113184) (not b!1113195) tp_is_empty!27741 (not b!1113188) (not b!1113191) (not start!97510) (not mapNonEmpty!43429))
(check-sat)
