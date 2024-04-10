; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83128 () Bool)

(assert start!83128)

(declare-fun b_free!19121 () Bool)

(declare-fun b_next!19121 () Bool)

(assert (=> start!83128 (= b_free!19121 (not b_next!19121))))

(declare-fun tp!66642 () Bool)

(declare-fun b_and!30609 () Bool)

(assert (=> start!83128 (= tp!66642 b_and!30609)))

(declare-fun b!969728 () Bool)

(declare-fun res!649056 () Bool)

(declare-fun e!546707 () Bool)

(assert (=> b!969728 (=> (not res!649056) (not e!546707))))

(declare-datatypes ((array!60101 0))(
  ( (array!60102 (arr!28914 (Array (_ BitVec 32) (_ BitVec 64))) (size!29393 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60101)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!969728 (= res!649056 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29393 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29393 _keys!1717))))))

(declare-fun b!969729 () Bool)

(declare-fun e!546708 () Bool)

(declare-fun tp_is_empty!22019 () Bool)

(assert (=> b!969729 (= e!546708 tp_is_empty!22019)))

(declare-fun b!969730 () Bool)

(assert (=> b!969730 (= e!546707 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!431669 () Bool)

(declare-datatypes ((V!34341 0))(
  ( (V!34342 (val!11060 Int)) )
))
(declare-datatypes ((ValueCell!10528 0))(
  ( (ValueCellFull!10528 (v!13619 V!34341)) (EmptyCell!10528) )
))
(declare-datatypes ((array!60103 0))(
  ( (array!60104 (arr!28915 (Array (_ BitVec 32) ValueCell!10528)) (size!29394 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60103)

(declare-fun zeroValue!1367 () V!34341)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34341)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14170 0))(
  ( (tuple2!14171 (_1!7096 (_ BitVec 64)) (_2!7096 V!34341)) )
))
(declare-datatypes ((List!20038 0))(
  ( (Nil!20035) (Cons!20034 (h!21196 tuple2!14170) (t!28401 List!20038)) )
))
(declare-datatypes ((ListLongMap!12867 0))(
  ( (ListLongMap!12868 (toList!6449 List!20038)) )
))
(declare-fun contains!5553 (ListLongMap!12867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3682 (array!60101 array!60103 (_ BitVec 32) (_ BitVec 32) V!34341 V!34341 (_ BitVec 32) Int) ListLongMap!12867)

(assert (=> b!969730 (= lt!431669 (contains!5553 (getCurrentListMap!3682 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28914 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35038 () Bool)

(declare-fun mapRes!35038 () Bool)

(assert (=> mapIsEmpty!35038 mapRes!35038))

(declare-fun mapNonEmpty!35038 () Bool)

(declare-fun tp!66641 () Bool)

(declare-fun e!546709 () Bool)

(assert (=> mapNonEmpty!35038 (= mapRes!35038 (and tp!66641 e!546709))))

(declare-fun mapKey!35038 () (_ BitVec 32))

(declare-fun mapValue!35038 () ValueCell!10528)

(declare-fun mapRest!35038 () (Array (_ BitVec 32) ValueCell!10528))

(assert (=> mapNonEmpty!35038 (= (arr!28915 _values!1425) (store mapRest!35038 mapKey!35038 mapValue!35038))))

(declare-fun b!969731 () Bool)

(declare-fun res!649051 () Bool)

(assert (=> b!969731 (=> (not res!649051) (not e!546707))))

(assert (=> b!969731 (= res!649051 (and (= (size!29394 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29393 _keys!1717) (size!29394 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969732 () Bool)

(declare-fun res!649052 () Bool)

(assert (=> b!969732 (=> (not res!649052) (not e!546707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969732 (= res!649052 (validKeyInArray!0 (select (arr!28914 _keys!1717) i!822)))))

(declare-fun b!969734 () Bool)

(declare-fun res!649055 () Bool)

(assert (=> b!969734 (=> (not res!649055) (not e!546707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60101 (_ BitVec 32)) Bool)

(assert (=> b!969734 (= res!649055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!649054 () Bool)

(assert (=> start!83128 (=> (not res!649054) (not e!546707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83128 (= res!649054 (validMask!0 mask!2147))))

(assert (=> start!83128 e!546707))

(assert (=> start!83128 true))

(declare-fun e!546705 () Bool)

(declare-fun array_inv!22381 (array!60103) Bool)

(assert (=> start!83128 (and (array_inv!22381 _values!1425) e!546705)))

(assert (=> start!83128 tp_is_empty!22019))

(assert (=> start!83128 tp!66642))

(declare-fun array_inv!22382 (array!60101) Bool)

(assert (=> start!83128 (array_inv!22382 _keys!1717)))

(declare-fun b!969733 () Bool)

(assert (=> b!969733 (= e!546709 tp_is_empty!22019)))

(declare-fun b!969735 () Bool)

(declare-fun res!649053 () Bool)

(assert (=> b!969735 (=> (not res!649053) (not e!546707))))

(declare-datatypes ((List!20039 0))(
  ( (Nil!20036) (Cons!20035 (h!21197 (_ BitVec 64)) (t!28402 List!20039)) )
))
(declare-fun arrayNoDuplicates!0 (array!60101 (_ BitVec 32) List!20039) Bool)

(assert (=> b!969735 (= res!649053 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20036))))

(declare-fun b!969736 () Bool)

(assert (=> b!969736 (= e!546705 (and e!546708 mapRes!35038))))

(declare-fun condMapEmpty!35038 () Bool)

(declare-fun mapDefault!35038 () ValueCell!10528)

