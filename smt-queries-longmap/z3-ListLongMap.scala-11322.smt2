; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132248 () Bool)

(assert start!132248)

(declare-fun b!1545915 () Bool)

(declare-fun e!860507 () Bool)

(declare-fun tp_is_empty!37825 () Bool)

(assert (=> b!1545915 (= e!860507 tp_is_empty!37825)))

(declare-fun b!1545916 () Bool)

(declare-fun e!860506 () Bool)

(assert (=> b!1545916 (= e!860506 tp_is_empty!37825)))

(declare-fun b!1545917 () Bool)

(declare-fun res!1059875 () Bool)

(declare-fun e!860505 () Bool)

(assert (=> b!1545917 (=> (not res!1059875) (not e!860505))))

(declare-datatypes ((array!102990 0))(
  ( (array!102991 (arr!49690 (Array (_ BitVec 32) (_ BitVec 64))) (size!50241 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102990)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102990 (_ BitVec 32)) Bool)

(assert (=> b!1545917 (= res!1059875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58441 () Bool)

(declare-fun mapRes!58441 () Bool)

(declare-fun tp!110968 () Bool)

(assert (=> mapNonEmpty!58441 (= mapRes!58441 (and tp!110968 e!860506))))

(declare-datatypes ((V!58877 0))(
  ( (V!58878 (val!18990 Int)) )
))
(declare-datatypes ((ValueCell!18002 0))(
  ( (ValueCellFull!18002 (v!21783 V!58877)) (EmptyCell!18002) )
))
(declare-fun mapRest!58441 () (Array (_ BitVec 32) ValueCell!18002))

(declare-fun mapValue!58441 () ValueCell!18002)

(declare-fun mapKey!58441 () (_ BitVec 32))

(declare-datatypes ((array!102992 0))(
  ( (array!102993 (arr!49691 (Array (_ BitVec 32) ValueCell!18002)) (size!50242 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102992)

(assert (=> mapNonEmpty!58441 (= (arr!49691 _values!470) (store mapRest!58441 mapKey!58441 mapValue!58441))))

(declare-fun b!1545919 () Bool)

(declare-fun res!1059874 () Bool)

(assert (=> b!1545919 (=> (not res!1059874) (not e!860505))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545919 (= res!1059874 (and (= (size!50242 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50241 _keys!618) (size!50242 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545920 () Bool)

(assert (=> b!1545920 (= e!860505 false)))

(declare-fun lt!666898 () Bool)

(declare-datatypes ((List!35955 0))(
  ( (Nil!35952) (Cons!35951 (h!37414 (_ BitVec 64)) (t!50641 List!35955)) )
))
(declare-fun arrayNoDuplicates!0 (array!102990 (_ BitVec 32) List!35955) Bool)

(assert (=> b!1545920 (= lt!666898 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35952))))

(declare-fun mapIsEmpty!58441 () Bool)

(assert (=> mapIsEmpty!58441 mapRes!58441))

(declare-fun b!1545918 () Bool)

(declare-fun e!860504 () Bool)

(assert (=> b!1545918 (= e!860504 (and e!860507 mapRes!58441))))

(declare-fun condMapEmpty!58441 () Bool)

(declare-fun mapDefault!58441 () ValueCell!18002)

(assert (=> b!1545918 (= condMapEmpty!58441 (= (arr!49691 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18002)) mapDefault!58441)))))

(declare-fun res!1059873 () Bool)

(assert (=> start!132248 (=> (not res!1059873) (not e!860505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132248 (= res!1059873 (validMask!0 mask!926))))

(assert (=> start!132248 e!860505))

(assert (=> start!132248 true))

(declare-fun array_inv!38919 (array!102992) Bool)

(assert (=> start!132248 (and (array_inv!38919 _values!470) e!860504)))

(declare-fun array_inv!38920 (array!102990) Bool)

(assert (=> start!132248 (array_inv!38920 _keys!618)))

(assert (= (and start!132248 res!1059873) b!1545919))

(assert (= (and b!1545919 res!1059874) b!1545917))

(assert (= (and b!1545917 res!1059875) b!1545920))

(assert (= (and b!1545918 condMapEmpty!58441) mapIsEmpty!58441))

(assert (= (and b!1545918 (not condMapEmpty!58441)) mapNonEmpty!58441))

(get-info :version)

(assert (= (and mapNonEmpty!58441 ((_ is ValueCellFull!18002) mapValue!58441)) b!1545916))

(assert (= (and b!1545918 ((_ is ValueCellFull!18002) mapDefault!58441)) b!1545915))

(assert (= start!132248 b!1545918))

(declare-fun m!1427031 () Bool)

(assert (=> b!1545917 m!1427031))

(declare-fun m!1427033 () Bool)

(assert (=> mapNonEmpty!58441 m!1427033))

(declare-fun m!1427035 () Bool)

(assert (=> b!1545920 m!1427035))

(declare-fun m!1427037 () Bool)

(assert (=> start!132248 m!1427037))

(declare-fun m!1427039 () Bool)

(assert (=> start!132248 m!1427039))

(declare-fun m!1427041 () Bool)

(assert (=> start!132248 m!1427041))

(check-sat (not b!1545920) (not start!132248) tp_is_empty!37825 (not mapNonEmpty!58441) (not b!1545917))
(check-sat)
