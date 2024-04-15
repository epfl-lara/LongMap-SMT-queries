; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97102 () Bool)

(assert start!97102)

(declare-fun b!1104263 () Bool)

(declare-fun res!736764 () Bool)

(declare-fun e!630319 () Bool)

(assert (=> b!1104263 (=> (not res!736764) (not e!630319))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104263 (= res!736764 (validKeyInArray!0 k0!934))))

(declare-fun b!1104264 () Bool)

(declare-fun res!736765 () Bool)

(assert (=> b!1104264 (=> (not res!736765) (not e!630319))))

(declare-datatypes ((array!71546 0))(
  ( (array!71547 (arr!34427 (Array (_ BitVec 32) (_ BitVec 64))) (size!34965 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71546)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71546 (_ BitVec 32)) Bool)

(assert (=> b!1104264 (= res!736765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!736759 () Bool)

(assert (=> start!97102 (=> (not res!736759) (not e!630319))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97102 (= res!736759 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34965 _keys!1208))))))

(assert (=> start!97102 e!630319))

(declare-fun array_inv!26550 (array!71546) Bool)

(assert (=> start!97102 (array_inv!26550 _keys!1208)))

(assert (=> start!97102 true))

(declare-datatypes ((V!41601 0))(
  ( (V!41602 (val!13734 Int)) )
))
(declare-datatypes ((ValueCell!12968 0))(
  ( (ValueCellFull!12968 (v!16366 V!41601)) (EmptyCell!12968) )
))
(declare-datatypes ((array!71548 0))(
  ( (array!71549 (arr!34428 (Array (_ BitVec 32) ValueCell!12968)) (size!34966 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71548)

(declare-fun e!630316 () Bool)

(declare-fun array_inv!26551 (array!71548) Bool)

(assert (=> start!97102 (and (array_inv!26551 _values!996) e!630316)))

(declare-fun b!1104265 () Bool)

(declare-fun res!736761 () Bool)

(assert (=> b!1104265 (=> (not res!736761) (not e!630319))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104265 (= res!736761 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34965 _keys!1208))))))

(declare-fun mapIsEmpty!42847 () Bool)

(declare-fun mapRes!42847 () Bool)

(assert (=> mapIsEmpty!42847 mapRes!42847))

(declare-fun b!1104266 () Bool)

(declare-fun res!736763 () Bool)

(assert (=> b!1104266 (=> (not res!736763) (not e!630319))))

(assert (=> b!1104266 (= res!736763 (= (select (arr!34427 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!42847 () Bool)

(declare-fun tp!81767 () Bool)

(declare-fun e!630318 () Bool)

(assert (=> mapNonEmpty!42847 (= mapRes!42847 (and tp!81767 e!630318))))

(declare-fun mapRest!42847 () (Array (_ BitVec 32) ValueCell!12968))

(declare-fun mapKey!42847 () (_ BitVec 32))

(declare-fun mapValue!42847 () ValueCell!12968)

(assert (=> mapNonEmpty!42847 (= (arr!34428 _values!996) (store mapRest!42847 mapKey!42847 mapValue!42847))))

(declare-fun b!1104267 () Bool)

(declare-fun res!736766 () Bool)

(assert (=> b!1104267 (=> (not res!736766) (not e!630319))))

(declare-datatypes ((List!24087 0))(
  ( (Nil!24084) (Cons!24083 (h!25292 (_ BitVec 64)) (t!34343 List!24087)) )
))
(declare-fun arrayNoDuplicates!0 (array!71546 (_ BitVec 32) List!24087) Bool)

(assert (=> b!1104267 (= res!736766 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24084))))

(declare-fun b!1104268 () Bool)

(declare-fun res!736762 () Bool)

(assert (=> b!1104268 (=> (not res!736762) (not e!630319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104268 (= res!736762 (validMask!0 mask!1564))))

(declare-fun b!1104269 () Bool)

(declare-fun tp_is_empty!27355 () Bool)

(assert (=> b!1104269 (= e!630318 tp_is_empty!27355)))

(declare-fun b!1104270 () Bool)

(declare-fun e!630320 () Bool)

(assert (=> b!1104270 (= e!630320 false)))

(declare-fun lt!494936 () Bool)

(declare-fun lt!494937 () array!71546)

(assert (=> b!1104270 (= lt!494936 (arrayNoDuplicates!0 lt!494937 #b00000000000000000000000000000000 Nil!24084))))

(declare-fun b!1104271 () Bool)

(declare-fun e!630317 () Bool)

(assert (=> b!1104271 (= e!630316 (and e!630317 mapRes!42847))))

(declare-fun condMapEmpty!42847 () Bool)

(declare-fun mapDefault!42847 () ValueCell!12968)

(assert (=> b!1104271 (= condMapEmpty!42847 (= (arr!34428 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12968)) mapDefault!42847)))))

(declare-fun b!1104272 () Bool)

(assert (=> b!1104272 (= e!630317 tp_is_empty!27355)))

(declare-fun b!1104273 () Bool)

(declare-fun res!736760 () Bool)

(assert (=> b!1104273 (=> (not res!736760) (not e!630319))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104273 (= res!736760 (and (= (size!34966 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34965 _keys!1208) (size!34966 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104274 () Bool)

(assert (=> b!1104274 (= e!630319 e!630320)))

(declare-fun res!736758 () Bool)

(assert (=> b!1104274 (=> (not res!736758) (not e!630320))))

(assert (=> b!1104274 (= res!736758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494937 mask!1564))))

(assert (=> b!1104274 (= lt!494937 (array!71547 (store (arr!34427 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34965 _keys!1208)))))

(assert (= (and start!97102 res!736759) b!1104268))

(assert (= (and b!1104268 res!736762) b!1104273))

(assert (= (and b!1104273 res!736760) b!1104264))

(assert (= (and b!1104264 res!736765) b!1104267))

(assert (= (and b!1104267 res!736766) b!1104265))

(assert (= (and b!1104265 res!736761) b!1104263))

(assert (= (and b!1104263 res!736764) b!1104266))

(assert (= (and b!1104266 res!736763) b!1104274))

(assert (= (and b!1104274 res!736758) b!1104270))

(assert (= (and b!1104271 condMapEmpty!42847) mapIsEmpty!42847))

(assert (= (and b!1104271 (not condMapEmpty!42847)) mapNonEmpty!42847))

(get-info :version)

(assert (= (and mapNonEmpty!42847 ((_ is ValueCellFull!12968) mapValue!42847)) b!1104269))

(assert (= (and b!1104271 ((_ is ValueCellFull!12968) mapDefault!42847)) b!1104272))

(assert (= start!97102 b!1104271))

(declare-fun m!1023547 () Bool)

(assert (=> b!1104264 m!1023547))

(declare-fun m!1023549 () Bool)

(assert (=> b!1104270 m!1023549))

(declare-fun m!1023551 () Bool)

(assert (=> b!1104266 m!1023551))

(declare-fun m!1023553 () Bool)

(assert (=> b!1104274 m!1023553))

(declare-fun m!1023555 () Bool)

(assert (=> b!1104274 m!1023555))

(declare-fun m!1023557 () Bool)

(assert (=> b!1104263 m!1023557))

(declare-fun m!1023559 () Bool)

(assert (=> b!1104268 m!1023559))

(declare-fun m!1023561 () Bool)

(assert (=> b!1104267 m!1023561))

(declare-fun m!1023563 () Bool)

(assert (=> start!97102 m!1023563))

(declare-fun m!1023565 () Bool)

(assert (=> start!97102 m!1023565))

(declare-fun m!1023567 () Bool)

(assert (=> mapNonEmpty!42847 m!1023567))

(check-sat (not b!1104274) (not b!1104268) (not start!97102) (not b!1104267) (not mapNonEmpty!42847) tp_is_empty!27355 (not b!1104270) (not b!1104263) (not b!1104264))
(check-sat)
