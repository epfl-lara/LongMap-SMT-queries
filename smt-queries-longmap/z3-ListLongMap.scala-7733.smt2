; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97128 () Bool)

(assert start!97128)

(declare-fun b!1104776 () Bool)

(declare-fun e!630588 () Bool)

(declare-fun e!630592 () Bool)

(assert (=> b!1104776 (= e!630588 e!630592)))

(declare-fun res!737099 () Bool)

(assert (=> b!1104776 (=> (not res!737099) (not e!630592))))

(declare-datatypes ((array!71671 0))(
  ( (array!71672 (arr!34489 (Array (_ BitVec 32) (_ BitVec 64))) (size!35025 (_ BitVec 32))) )
))
(declare-fun lt!495197 () array!71671)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71671 (_ BitVec 32)) Bool)

(assert (=> b!1104776 (= res!737099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495197 mask!1564))))

(declare-fun _keys!1208 () array!71671)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104776 (= lt!495197 (array!71672 (store (arr!34489 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35025 _keys!1208)))))

(declare-fun b!1104777 () Bool)

(declare-fun res!737102 () Bool)

(assert (=> b!1104777 (=> (not res!737102) (not e!630588))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1104777 (= res!737102 (= (select (arr!34489 _keys!1208) i!673) k0!934))))

(declare-fun b!1104778 () Bool)

(declare-fun res!737103 () Bool)

(assert (=> b!1104778 (=> (not res!737103) (not e!630588))))

(assert (=> b!1104778 (= res!737103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!737097 () Bool)

(assert (=> start!97128 (=> (not res!737097) (not e!630588))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97128 (= res!737097 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35025 _keys!1208))))))

(assert (=> start!97128 e!630588))

(declare-fun array_inv!26552 (array!71671) Bool)

(assert (=> start!97128 (array_inv!26552 _keys!1208)))

(assert (=> start!97128 true))

(declare-datatypes ((V!41627 0))(
  ( (V!41628 (val!13744 Int)) )
))
(declare-datatypes ((ValueCell!12978 0))(
  ( (ValueCellFull!12978 (v!16377 V!41627)) (EmptyCell!12978) )
))
(declare-datatypes ((array!71673 0))(
  ( (array!71674 (arr!34490 (Array (_ BitVec 32) ValueCell!12978)) (size!35026 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71673)

(declare-fun e!630589 () Bool)

(declare-fun array_inv!26553 (array!71673) Bool)

(assert (=> start!97128 (and (array_inv!26553 _values!996) e!630589)))

(declare-fun b!1104779 () Bool)

(assert (=> b!1104779 (= e!630592 false)))

(declare-fun lt!495196 () Bool)

(declare-datatypes ((List!24063 0))(
  ( (Nil!24060) (Cons!24059 (h!25268 (_ BitVec 64)) (t!34328 List!24063)) )
))
(declare-fun arrayNoDuplicates!0 (array!71671 (_ BitVec 32) List!24063) Bool)

(assert (=> b!1104779 (= lt!495196 (arrayNoDuplicates!0 lt!495197 #b00000000000000000000000000000000 Nil!24060))))

(declare-fun b!1104780 () Bool)

(declare-fun e!630591 () Bool)

(declare-fun tp_is_empty!27375 () Bool)

(assert (=> b!1104780 (= e!630591 tp_is_empty!27375)))

(declare-fun mapIsEmpty!42877 () Bool)

(declare-fun mapRes!42877 () Bool)

(assert (=> mapIsEmpty!42877 mapRes!42877))

(declare-fun b!1104781 () Bool)

(declare-fun res!737100 () Bool)

(assert (=> b!1104781 (=> (not res!737100) (not e!630588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104781 (= res!737100 (validKeyInArray!0 k0!934))))

(declare-fun b!1104782 () Bool)

(declare-fun res!737101 () Bool)

(assert (=> b!1104782 (=> (not res!737101) (not e!630588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104782 (= res!737101 (validMask!0 mask!1564))))

(declare-fun b!1104783 () Bool)

(declare-fun res!737105 () Bool)

(assert (=> b!1104783 (=> (not res!737105) (not e!630588))))

(assert (=> b!1104783 (= res!737105 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35025 _keys!1208))))))

(declare-fun b!1104784 () Bool)

(declare-fun res!737104 () Bool)

(assert (=> b!1104784 (=> (not res!737104) (not e!630588))))

(assert (=> b!1104784 (= res!737104 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24060))))

(declare-fun b!1104785 () Bool)

(declare-fun e!630593 () Bool)

(assert (=> b!1104785 (= e!630589 (and e!630593 mapRes!42877))))

(declare-fun condMapEmpty!42877 () Bool)

(declare-fun mapDefault!42877 () ValueCell!12978)

(assert (=> b!1104785 (= condMapEmpty!42877 (= (arr!34490 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12978)) mapDefault!42877)))))

(declare-fun b!1104786 () Bool)

(assert (=> b!1104786 (= e!630593 tp_is_empty!27375)))

(declare-fun b!1104787 () Bool)

(declare-fun res!737098 () Bool)

(assert (=> b!1104787 (=> (not res!737098) (not e!630588))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104787 (= res!737098 (and (= (size!35026 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35025 _keys!1208) (size!35026 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42877 () Bool)

(declare-fun tp!81797 () Bool)

(assert (=> mapNonEmpty!42877 (= mapRes!42877 (and tp!81797 e!630591))))

(declare-fun mapRest!42877 () (Array (_ BitVec 32) ValueCell!12978))

(declare-fun mapValue!42877 () ValueCell!12978)

(declare-fun mapKey!42877 () (_ BitVec 32))

(assert (=> mapNonEmpty!42877 (= (arr!34490 _values!996) (store mapRest!42877 mapKey!42877 mapValue!42877))))

(assert (= (and start!97128 res!737097) b!1104782))

(assert (= (and b!1104782 res!737101) b!1104787))

(assert (= (and b!1104787 res!737098) b!1104778))

(assert (= (and b!1104778 res!737103) b!1104784))

(assert (= (and b!1104784 res!737104) b!1104783))

(assert (= (and b!1104783 res!737105) b!1104781))

(assert (= (and b!1104781 res!737100) b!1104777))

(assert (= (and b!1104777 res!737102) b!1104776))

(assert (= (and b!1104776 res!737099) b!1104779))

(assert (= (and b!1104785 condMapEmpty!42877) mapIsEmpty!42877))

(assert (= (and b!1104785 (not condMapEmpty!42877)) mapNonEmpty!42877))

(get-info :version)

(assert (= (and mapNonEmpty!42877 ((_ is ValueCellFull!12978) mapValue!42877)) b!1104780))

(assert (= (and b!1104785 ((_ is ValueCellFull!12978) mapDefault!42877)) b!1104786))

(assert (= start!97128 b!1104785))

(declare-fun m!1024393 () Bool)

(assert (=> b!1104777 m!1024393))

(declare-fun m!1024395 () Bool)

(assert (=> b!1104782 m!1024395))

(declare-fun m!1024397 () Bool)

(assert (=> mapNonEmpty!42877 m!1024397))

(declare-fun m!1024399 () Bool)

(assert (=> b!1104778 m!1024399))

(declare-fun m!1024401 () Bool)

(assert (=> b!1104779 m!1024401))

(declare-fun m!1024403 () Bool)

(assert (=> b!1104784 m!1024403))

(declare-fun m!1024405 () Bool)

(assert (=> b!1104781 m!1024405))

(declare-fun m!1024407 () Bool)

(assert (=> b!1104776 m!1024407))

(declare-fun m!1024409 () Bool)

(assert (=> b!1104776 m!1024409))

(declare-fun m!1024411 () Bool)

(assert (=> start!97128 m!1024411))

(declare-fun m!1024413 () Bool)

(assert (=> start!97128 m!1024413))

(check-sat (not b!1104782) (not mapNonEmpty!42877) (not b!1104776) tp_is_empty!27375 (not b!1104784) (not start!97128) (not b!1104781) (not b!1104779) (not b!1104778))
(check-sat)
