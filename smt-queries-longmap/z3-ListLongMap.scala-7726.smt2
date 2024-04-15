; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97036 () Bool)

(assert start!97036)

(declare-fun b!1103658 () Bool)

(declare-fun e!630017 () Bool)

(declare-fun tp_is_empty!27331 () Bool)

(assert (=> b!1103658 (= e!630017 tp_is_empty!27331)))

(declare-fun b!1103659 () Bool)

(declare-fun res!736327 () Bool)

(declare-fun e!630016 () Bool)

(assert (=> b!1103659 (=> (not res!736327) (not e!630016))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103659 (= res!736327 (validKeyInArray!0 k0!934))))

(declare-fun b!1103660 () Bool)

(declare-fun res!736332 () Bool)

(assert (=> b!1103660 (=> (not res!736332) (not e!630016))))

(declare-datatypes ((array!71492 0))(
  ( (array!71493 (arr!34403 (Array (_ BitVec 32) (_ BitVec 64))) (size!34941 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71492)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71492 (_ BitVec 32)) Bool)

(assert (=> b!1103660 (= res!736332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!42802 () Bool)

(declare-fun mapRes!42802 () Bool)

(declare-fun tp!81722 () Bool)

(declare-fun e!630015 () Bool)

(assert (=> mapNonEmpty!42802 (= mapRes!42802 (and tp!81722 e!630015))))

(declare-datatypes ((V!41569 0))(
  ( (V!41570 (val!13722 Int)) )
))
(declare-datatypes ((ValueCell!12956 0))(
  ( (ValueCellFull!12956 (v!16353 V!41569)) (EmptyCell!12956) )
))
(declare-fun mapValue!42802 () ValueCell!12956)

(declare-fun mapRest!42802 () (Array (_ BitVec 32) ValueCell!12956))

(declare-datatypes ((array!71494 0))(
  ( (array!71495 (arr!34404 (Array (_ BitVec 32) ValueCell!12956)) (size!34942 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71494)

(declare-fun mapKey!42802 () (_ BitVec 32))

(assert (=> mapNonEmpty!42802 (= (arr!34404 _values!996) (store mapRest!42802 mapKey!42802 mapValue!42802))))

(declare-fun b!1103661 () Bool)

(declare-fun res!736334 () Bool)

(assert (=> b!1103661 (=> (not res!736334) (not e!630016))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1103661 (= res!736334 (= (select (arr!34403 _keys!1208) i!673) k0!934))))

(declare-fun b!1103662 () Bool)

(declare-fun res!736330 () Bool)

(assert (=> b!1103662 (=> (not res!736330) (not e!630016))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103662 (= res!736330 (and (= (size!34942 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34941 _keys!1208) (size!34942 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103663 () Bool)

(declare-fun e!630018 () Bool)

(assert (=> b!1103663 (= e!630018 (and e!630017 mapRes!42802))))

(declare-fun condMapEmpty!42802 () Bool)

(declare-fun mapDefault!42802 () ValueCell!12956)

(assert (=> b!1103663 (= condMapEmpty!42802 (= (arr!34404 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12956)) mapDefault!42802)))))

(declare-fun b!1103664 () Bool)

(declare-fun res!736328 () Bool)

(assert (=> b!1103664 (=> (not res!736328) (not e!630016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103664 (= res!736328 (validMask!0 mask!1564))))

(declare-fun b!1103666 () Bool)

(declare-fun res!736329 () Bool)

(assert (=> b!1103666 (=> (not res!736329) (not e!630016))))

(assert (=> b!1103666 (= res!736329 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34941 _keys!1208))))))

(declare-fun b!1103667 () Bool)

(declare-fun res!736333 () Bool)

(assert (=> b!1103667 (=> (not res!736333) (not e!630016))))

(declare-datatypes ((List!24079 0))(
  ( (Nil!24076) (Cons!24075 (h!25284 (_ BitVec 64)) (t!34335 List!24079)) )
))
(declare-fun arrayNoDuplicates!0 (array!71492 (_ BitVec 32) List!24079) Bool)

(assert (=> b!1103667 (= res!736333 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24076))))

(declare-fun b!1103668 () Bool)

(assert (=> b!1103668 (= e!630015 tp_is_empty!27331)))

(declare-fun b!1103669 () Bool)

(assert (=> b!1103669 (= e!630016 (bvsgt #b00000000000000000000000000000000 (size!34941 _keys!1208)))))

(declare-fun mapIsEmpty!42802 () Bool)

(assert (=> mapIsEmpty!42802 mapRes!42802))

(declare-fun res!736335 () Bool)

(assert (=> start!97036 (=> (not res!736335) (not e!630016))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97036 (= res!736335 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34941 _keys!1208))))))

(assert (=> start!97036 e!630016))

(declare-fun array_inv!26530 (array!71492) Bool)

(assert (=> start!97036 (array_inv!26530 _keys!1208)))

(assert (=> start!97036 true))

(declare-fun array_inv!26531 (array!71494) Bool)

(assert (=> start!97036 (and (array_inv!26531 _values!996) e!630018)))

(declare-fun b!1103665 () Bool)

(declare-fun res!736331 () Bool)

(assert (=> b!1103665 (=> (not res!736331) (not e!630016))))

(assert (=> b!1103665 (= res!736331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71493 (store (arr!34403 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34941 _keys!1208)) mask!1564))))

(assert (= (and start!97036 res!736335) b!1103664))

(assert (= (and b!1103664 res!736328) b!1103662))

(assert (= (and b!1103662 res!736330) b!1103660))

(assert (= (and b!1103660 res!736332) b!1103667))

(assert (= (and b!1103667 res!736333) b!1103666))

(assert (= (and b!1103666 res!736329) b!1103659))

(assert (= (and b!1103659 res!736327) b!1103661))

(assert (= (and b!1103661 res!736334) b!1103665))

(assert (= (and b!1103665 res!736331) b!1103669))

(assert (= (and b!1103663 condMapEmpty!42802) mapIsEmpty!42802))

(assert (= (and b!1103663 (not condMapEmpty!42802)) mapNonEmpty!42802))

(get-info :version)

(assert (= (and mapNonEmpty!42802 ((_ is ValueCellFull!12956) mapValue!42802)) b!1103668))

(assert (= (and b!1103663 ((_ is ValueCellFull!12956) mapDefault!42802)) b!1103658))

(assert (= start!97036 b!1103663))

(declare-fun m!1023175 () Bool)

(assert (=> b!1103665 m!1023175))

(declare-fun m!1023177 () Bool)

(assert (=> b!1103665 m!1023177))

(declare-fun m!1023179 () Bool)

(assert (=> start!97036 m!1023179))

(declare-fun m!1023181 () Bool)

(assert (=> start!97036 m!1023181))

(declare-fun m!1023183 () Bool)

(assert (=> b!1103659 m!1023183))

(declare-fun m!1023185 () Bool)

(assert (=> b!1103661 m!1023185))

(declare-fun m!1023187 () Bool)

(assert (=> b!1103660 m!1023187))

(declare-fun m!1023189 () Bool)

(assert (=> b!1103667 m!1023189))

(declare-fun m!1023191 () Bool)

(assert (=> b!1103664 m!1023191))

(declare-fun m!1023193 () Bool)

(assert (=> mapNonEmpty!42802 m!1023193))

(check-sat (not b!1103665) (not start!97036) tp_is_empty!27331 (not b!1103659) (not mapNonEmpty!42802) (not b!1103660) (not b!1103667) (not b!1103664))
(check-sat)
