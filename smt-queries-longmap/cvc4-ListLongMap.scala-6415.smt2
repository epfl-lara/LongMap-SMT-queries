; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82290 () Bool)

(assert start!82290)

(declare-fun b_free!18563 () Bool)

(declare-fun b_next!18563 () Bool)

(assert (=> start!82290 (= b_free!18563 (not b_next!18563))))

(declare-fun tp!64649 () Bool)

(declare-fun b_and!30051 () Bool)

(assert (=> start!82290 (= tp!64649 b_and!30051)))

(declare-fun b!959332 () Bool)

(declare-fun e!540792 () Bool)

(assert (=> b!959332 (= e!540792 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33341 0))(
  ( (V!33342 (val!10685 Int)) )
))
(declare-fun minValue!1328 () V!33341)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58633 0))(
  ( (array!58634 (arr!28190 (Array (_ BitVec 32) (_ BitVec 64))) (size!28669 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58633)

(declare-datatypes ((ValueCell!10153 0))(
  ( (ValueCellFull!10153 (v!13242 V!33341)) (EmptyCell!10153) )
))
(declare-datatypes ((array!58635 0))(
  ( (array!58636 (arr!28191 (Array (_ BitVec 32) ValueCell!10153)) (size!28670 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58635)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33341)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13784 0))(
  ( (tuple2!13785 (_1!6903 (_ BitVec 64)) (_2!6903 V!33341)) )
))
(declare-datatypes ((List!19602 0))(
  ( (Nil!19599) (Cons!19598 (h!20760 tuple2!13784) (t!27965 List!19602)) )
))
(declare-datatypes ((ListLongMap!12481 0))(
  ( (ListLongMap!12482 (toList!6256 List!19602)) )
))
(declare-fun contains!5357 (ListLongMap!12481 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3489 (array!58633 array!58635 (_ BitVec 32) (_ BitVec 32) V!33341 V!33341 (_ BitVec 32) Int) ListLongMap!12481)

(assert (=> b!959332 (contains!5357 (getCurrentListMap!3489 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28190 _keys!1668) i!793))))

(declare-datatypes ((Unit!32187 0))(
  ( (Unit!32188) )
))
(declare-fun lt!430536 () Unit!32187)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!15 (array!58633 array!58635 (_ BitVec 32) (_ BitVec 32) V!33341 V!33341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32187)

(assert (=> b!959332 (= lt!430536 (lemmaInListMapFromThenInFromSmaller!15 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959333 () Bool)

(declare-fun res!642163 () Bool)

(assert (=> b!959333 (=> (not res!642163) (not e!540792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58633 (_ BitVec 32)) Bool)

(assert (=> b!959333 (= res!642163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959334 () Bool)

(declare-fun e!540795 () Bool)

(declare-fun tp_is_empty!21269 () Bool)

(assert (=> b!959334 (= e!540795 tp_is_empty!21269)))

(declare-fun mapIsEmpty!33883 () Bool)

(declare-fun mapRes!33883 () Bool)

(assert (=> mapIsEmpty!33883 mapRes!33883))

(declare-fun b!959336 () Bool)

(declare-fun e!540793 () Bool)

(assert (=> b!959336 (= e!540793 tp_is_empty!21269)))

(declare-fun b!959337 () Bool)

(declare-fun res!642159 () Bool)

(assert (=> b!959337 (=> (not res!642159) (not e!540792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959337 (= res!642159 (validKeyInArray!0 (select (arr!28190 _keys!1668) i!793)))))

(declare-fun b!959338 () Bool)

(declare-fun res!642160 () Bool)

(assert (=> b!959338 (=> (not res!642160) (not e!540792))))

(assert (=> b!959338 (= res!642160 (and (= (size!28670 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28669 _keys!1668) (size!28670 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33883 () Bool)

(declare-fun tp!64650 () Bool)

(assert (=> mapNonEmpty!33883 (= mapRes!33883 (and tp!64650 e!540795))))

(declare-fun mapRest!33883 () (Array (_ BitVec 32) ValueCell!10153))

(declare-fun mapKey!33883 () (_ BitVec 32))

(declare-fun mapValue!33883 () ValueCell!10153)

(assert (=> mapNonEmpty!33883 (= (arr!28191 _values!1386) (store mapRest!33883 mapKey!33883 mapValue!33883))))

(declare-fun b!959339 () Bool)

(declare-fun res!642158 () Bool)

(assert (=> b!959339 (=> (not res!642158) (not e!540792))))

(declare-datatypes ((List!19603 0))(
  ( (Nil!19600) (Cons!19599 (h!20761 (_ BitVec 64)) (t!27966 List!19603)) )
))
(declare-fun arrayNoDuplicates!0 (array!58633 (_ BitVec 32) List!19603) Bool)

(assert (=> b!959339 (= res!642158 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19600))))

(declare-fun b!959340 () Bool)

(declare-fun e!540794 () Bool)

(assert (=> b!959340 (= e!540794 (and e!540793 mapRes!33883))))

(declare-fun condMapEmpty!33883 () Bool)

(declare-fun mapDefault!33883 () ValueCell!10153)

