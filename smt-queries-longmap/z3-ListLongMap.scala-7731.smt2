; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97108 () Bool)

(assert start!97108)

(declare-fun b!1104371 () Bool)

(declare-fun res!736847 () Bool)

(declare-fun e!630370 () Bool)

(assert (=> b!1104371 (=> (not res!736847) (not e!630370))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104371 (= res!736847 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!42856 () Bool)

(declare-fun mapRes!42856 () Bool)

(declare-fun tp!81776 () Bool)

(declare-fun e!630374 () Bool)

(assert (=> mapNonEmpty!42856 (= mapRes!42856 (and tp!81776 e!630374))))

(declare-fun mapKey!42856 () (_ BitVec 32))

(declare-datatypes ((V!41609 0))(
  ( (V!41610 (val!13737 Int)) )
))
(declare-datatypes ((ValueCell!12971 0))(
  ( (ValueCellFull!12971 (v!16369 V!41609)) (EmptyCell!12971) )
))
(declare-fun mapRest!42856 () (Array (_ BitVec 32) ValueCell!12971))

(declare-fun mapValue!42856 () ValueCell!12971)

(declare-datatypes ((array!71558 0))(
  ( (array!71559 (arr!34433 (Array (_ BitVec 32) ValueCell!12971)) (size!34971 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71558)

(assert (=> mapNonEmpty!42856 (= (arr!34433 _values!996) (store mapRest!42856 mapKey!42856 mapValue!42856))))

(declare-fun b!1104372 () Bool)

(declare-fun e!630373 () Bool)

(assert (=> b!1104372 (= e!630370 e!630373)))

(declare-fun res!736845 () Bool)

(assert (=> b!1104372 (=> (not res!736845) (not e!630373))))

(declare-datatypes ((array!71560 0))(
  ( (array!71561 (arr!34434 (Array (_ BitVec 32) (_ BitVec 64))) (size!34972 (_ BitVec 32))) )
))
(declare-fun lt!494954 () array!71560)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71560 (_ BitVec 32)) Bool)

(assert (=> b!1104372 (= res!736845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494954 mask!1564))))

(declare-fun _keys!1208 () array!71560)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104372 (= lt!494954 (array!71561 (store (arr!34434 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34972 _keys!1208)))))

(declare-fun b!1104373 () Bool)

(declare-fun res!736846 () Bool)

(assert (=> b!1104373 (=> (not res!736846) (not e!630370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104373 (= res!736846 (validMask!0 mask!1564))))

(declare-fun b!1104374 () Bool)

(assert (=> b!1104374 (= e!630373 false)))

(declare-fun lt!494955 () Bool)

(declare-datatypes ((List!24090 0))(
  ( (Nil!24087) (Cons!24086 (h!25295 (_ BitVec 64)) (t!34346 List!24090)) )
))
(declare-fun arrayNoDuplicates!0 (array!71560 (_ BitVec 32) List!24090) Bool)

(assert (=> b!1104374 (= lt!494955 (arrayNoDuplicates!0 lt!494954 #b00000000000000000000000000000000 Nil!24087))))

(declare-fun b!1104375 () Bool)

(declare-fun res!736844 () Bool)

(assert (=> b!1104375 (=> (not res!736844) (not e!630370))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104375 (= res!736844 (and (= (size!34971 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34972 _keys!1208) (size!34971 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104376 () Bool)

(declare-fun res!736842 () Bool)

(assert (=> b!1104376 (=> (not res!736842) (not e!630370))))

(assert (=> b!1104376 (= res!736842 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24087))))

(declare-fun res!736840 () Bool)

(assert (=> start!97108 (=> (not res!736840) (not e!630370))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97108 (= res!736840 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34972 _keys!1208))))))

(assert (=> start!97108 e!630370))

(declare-fun array_inv!26552 (array!71560) Bool)

(assert (=> start!97108 (array_inv!26552 _keys!1208)))

(assert (=> start!97108 true))

(declare-fun e!630371 () Bool)

(declare-fun array_inv!26553 (array!71558) Bool)

(assert (=> start!97108 (and (array_inv!26553 _values!996) e!630371)))

(declare-fun mapIsEmpty!42856 () Bool)

(assert (=> mapIsEmpty!42856 mapRes!42856))

(declare-fun b!1104377 () Bool)

(declare-fun res!736839 () Bool)

(assert (=> b!1104377 (=> (not res!736839) (not e!630370))))

(assert (=> b!1104377 (= res!736839 (= (select (arr!34434 _keys!1208) i!673) k0!934))))

(declare-fun b!1104378 () Bool)

(declare-fun e!630369 () Bool)

(declare-fun tp_is_empty!27361 () Bool)

(assert (=> b!1104378 (= e!630369 tp_is_empty!27361)))

(declare-fun b!1104379 () Bool)

(assert (=> b!1104379 (= e!630371 (and e!630369 mapRes!42856))))

(declare-fun condMapEmpty!42856 () Bool)

(declare-fun mapDefault!42856 () ValueCell!12971)

(assert (=> b!1104379 (= condMapEmpty!42856 (= (arr!34433 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12971)) mapDefault!42856)))))

(declare-fun b!1104380 () Bool)

(declare-fun res!736843 () Bool)

(assert (=> b!1104380 (=> (not res!736843) (not e!630370))))

(assert (=> b!1104380 (= res!736843 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34972 _keys!1208))))))

(declare-fun b!1104381 () Bool)

(declare-fun res!736841 () Bool)

(assert (=> b!1104381 (=> (not res!736841) (not e!630370))))

(assert (=> b!1104381 (= res!736841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104382 () Bool)

(assert (=> b!1104382 (= e!630374 tp_is_empty!27361)))

(assert (= (and start!97108 res!736840) b!1104373))

(assert (= (and b!1104373 res!736846) b!1104375))

(assert (= (and b!1104375 res!736844) b!1104381))

(assert (= (and b!1104381 res!736841) b!1104376))

(assert (= (and b!1104376 res!736842) b!1104380))

(assert (= (and b!1104380 res!736843) b!1104371))

(assert (= (and b!1104371 res!736847) b!1104377))

(assert (= (and b!1104377 res!736839) b!1104372))

(assert (= (and b!1104372 res!736845) b!1104374))

(assert (= (and b!1104379 condMapEmpty!42856) mapIsEmpty!42856))

(assert (= (and b!1104379 (not condMapEmpty!42856)) mapNonEmpty!42856))

(get-info :version)

(assert (= (and mapNonEmpty!42856 ((_ is ValueCellFull!12971) mapValue!42856)) b!1104382))

(assert (= (and b!1104379 ((_ is ValueCellFull!12971) mapDefault!42856)) b!1104378))

(assert (= start!97108 b!1104379))

(declare-fun m!1023613 () Bool)

(assert (=> b!1104376 m!1023613))

(declare-fun m!1023615 () Bool)

(assert (=> b!1104381 m!1023615))

(declare-fun m!1023617 () Bool)

(assert (=> b!1104371 m!1023617))

(declare-fun m!1023619 () Bool)

(assert (=> b!1104377 m!1023619))

(declare-fun m!1023621 () Bool)

(assert (=> b!1104372 m!1023621))

(declare-fun m!1023623 () Bool)

(assert (=> b!1104372 m!1023623))

(declare-fun m!1023625 () Bool)

(assert (=> b!1104373 m!1023625))

(declare-fun m!1023627 () Bool)

(assert (=> start!97108 m!1023627))

(declare-fun m!1023629 () Bool)

(assert (=> start!97108 m!1023629))

(declare-fun m!1023631 () Bool)

(assert (=> b!1104374 m!1023631))

(declare-fun m!1023633 () Bool)

(assert (=> mapNonEmpty!42856 m!1023633))

(check-sat (not b!1104376) (not b!1104374) (not b!1104371) (not mapNonEmpty!42856) (not b!1104381) (not b!1104373) tp_is_empty!27361 (not b!1104372) (not start!97108))
(check-sat)
