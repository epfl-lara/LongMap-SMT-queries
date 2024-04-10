; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35102 () Bool)

(assert start!35102)

(declare-fun b_free!7747 () Bool)

(declare-fun b_next!7747 () Bool)

(assert (=> start!35102 (= b_free!7747 (not b_next!7747))))

(declare-fun tp!26825 () Bool)

(declare-fun b_and!14981 () Bool)

(assert (=> start!35102 (= tp!26825 b_and!14981)))

(declare-fun res!195134 () Bool)

(declare-fun e!215471 () Bool)

(assert (=> start!35102 (=> (not res!195134) (not e!215471))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35102 (= res!195134 (validMask!0 mask!2385))))

(assert (=> start!35102 e!215471))

(assert (=> start!35102 true))

(declare-fun tp_is_empty!7699 () Bool)

(assert (=> start!35102 tp_is_empty!7699))

(assert (=> start!35102 tp!26825))

(declare-datatypes ((V!11243 0))(
  ( (V!11244 (val!3894 Int)) )
))
(declare-datatypes ((ValueCell!3506 0))(
  ( (ValueCellFull!3506 (v!6083 V!11243)) (EmptyCell!3506) )
))
(declare-datatypes ((array!18987 0))(
  ( (array!18988 (arr!8997 (Array (_ BitVec 32) ValueCell!3506)) (size!9349 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18987)

(declare-fun e!215473 () Bool)

(declare-fun array_inv!6636 (array!18987) Bool)

(assert (=> start!35102 (and (array_inv!6636 _values!1525) e!215473)))

(declare-datatypes ((array!18989 0))(
  ( (array!18990 (arr!8998 (Array (_ BitVec 32) (_ BitVec 64))) (size!9350 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18989)

(declare-fun array_inv!6637 (array!18989) Bool)

(assert (=> start!35102 (array_inv!6637 _keys!1895)))

(declare-fun b!351860 () Bool)

(declare-datatypes ((Unit!10872 0))(
  ( (Unit!10873) )
))
(declare-fun e!215470 () Unit!10872)

(declare-fun Unit!10874 () Unit!10872)

(assert (=> b!351860 (= e!215470 Unit!10874)))

(declare-fun b!351861 () Bool)

(declare-fun res!195132 () Bool)

(assert (=> b!351861 (=> (not res!195132) (not e!215471))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351861 (= res!195132 (and (= (size!9349 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9350 _keys!1895) (size!9349 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351862 () Bool)

(declare-fun res!195131 () Bool)

(assert (=> b!351862 (=> (not res!195131) (not e!215471))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351862 (= res!195131 (validKeyInArray!0 k!1348))))

(declare-fun b!351863 () Bool)

(declare-fun res!195129 () Bool)

(assert (=> b!351863 (=> (not res!195129) (not e!215471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18989 (_ BitVec 32)) Bool)

(assert (=> b!351863 (= res!195129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351864 () Bool)

(declare-fun e!215469 () Bool)

(assert (=> b!351864 (= e!215469 tp_is_empty!7699)))

(declare-fun b!351865 () Bool)

(declare-fun e!215475 () Bool)

(assert (=> b!351865 (= e!215471 e!215475)))

(declare-fun res!195133 () Bool)

(assert (=> b!351865 (=> (not res!195133) (not e!215475))))

(declare-datatypes ((SeekEntryResult!3462 0))(
  ( (MissingZero!3462 (index!16027 (_ BitVec 32))) (Found!3462 (index!16028 (_ BitVec 32))) (Intermediate!3462 (undefined!4274 Bool) (index!16029 (_ BitVec 32)) (x!35018 (_ BitVec 32))) (Undefined!3462) (MissingVacant!3462 (index!16030 (_ BitVec 32))) )
))
(declare-fun lt!164990 () SeekEntryResult!3462)

(assert (=> b!351865 (= res!195133 (and (not (is-Found!3462 lt!164990)) (not (is-MissingZero!3462 lt!164990)) (is-MissingVacant!3462 lt!164990)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18989 (_ BitVec 32)) SeekEntryResult!3462)

(assert (=> b!351865 (= lt!164990 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!351866 () Bool)

(declare-fun res!195130 () Bool)

(assert (=> b!351866 (=> (not res!195130) (not e!215471))))

(declare-fun zeroValue!1467 () V!11243)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11243)

(declare-datatypes ((tuple2!5614 0))(
  ( (tuple2!5615 (_1!2818 (_ BitVec 64)) (_2!2818 V!11243)) )
))
(declare-datatypes ((List!5235 0))(
  ( (Nil!5232) (Cons!5231 (h!6087 tuple2!5614) (t!10377 List!5235)) )
))
(declare-datatypes ((ListLongMap!4527 0))(
  ( (ListLongMap!4528 (toList!2279 List!5235)) )
))
(declare-fun contains!2350 (ListLongMap!4527 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1800 (array!18989 array!18987 (_ BitVec 32) (_ BitVec 32) V!11243 V!11243 (_ BitVec 32) Int) ListLongMap!4527)

(assert (=> b!351866 (= res!195130 (not (contains!2350 (getCurrentListMap!1800 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!351867 () Bool)

(declare-fun res!195128 () Bool)

(assert (=> b!351867 (=> (not res!195128) (not e!215471))))

(declare-datatypes ((List!5236 0))(
  ( (Nil!5233) (Cons!5232 (h!6088 (_ BitVec 64)) (t!10378 List!5236)) )
))
(declare-fun arrayNoDuplicates!0 (array!18989 (_ BitVec 32) List!5236) Bool)

(assert (=> b!351867 (= res!195128 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5233))))

(declare-fun b!351868 () Bool)

(declare-fun Unit!10875 () Unit!10872)

(assert (=> b!351868 (= e!215470 Unit!10875)))

(declare-fun lt!164989 () Unit!10872)

(declare-fun lemmaArrayContainsKeyThenInListMap!329 (array!18989 array!18987 (_ BitVec 32) (_ BitVec 32) V!11243 V!11243 (_ BitVec 64) (_ BitVec 32) Int) Unit!10872)

(declare-fun arrayScanForKey!0 (array!18989 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351868 (= lt!164989 (lemmaArrayContainsKeyThenInListMap!329 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!351868 false))

(declare-fun b!351869 () Bool)

(declare-fun lt!164991 () Bool)

(assert (=> b!351869 (= e!215475 lt!164991)))

(declare-fun lt!164992 () Unit!10872)

(assert (=> b!351869 (= lt!164992 e!215470)))

(declare-fun c!53499 () Bool)

(assert (=> b!351869 (= c!53499 lt!164991)))

(declare-fun arrayContainsKey!0 (array!18989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351869 (= lt!164991 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351870 () Bool)

(declare-fun e!215472 () Bool)

(assert (=> b!351870 (= e!215472 tp_is_empty!7699)))

(declare-fun b!351871 () Bool)

(declare-fun mapRes!13026 () Bool)

(assert (=> b!351871 (= e!215473 (and e!215469 mapRes!13026))))

(declare-fun condMapEmpty!13026 () Bool)

(declare-fun mapDefault!13026 () ValueCell!3506)

