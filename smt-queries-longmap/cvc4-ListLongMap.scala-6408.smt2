; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82248 () Bool)

(assert start!82248)

(declare-fun b_free!18521 () Bool)

(declare-fun b_next!18521 () Bool)

(assert (=> start!82248 (= b_free!18521 (not b_next!18521))))

(declare-fun tp!64524 () Bool)

(declare-fun b_and!30009 () Bool)

(assert (=> start!82248 (= tp!64524 b_and!30009)))

(declare-fun b!958712 () Bool)

(declare-fun e!540477 () Bool)

(assert (=> b!958712 (= e!540477 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33285 0))(
  ( (V!33286 (val!10664 Int)) )
))
(declare-fun minValue!1328 () V!33285)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430473 () Bool)

(declare-datatypes ((array!58553 0))(
  ( (array!58554 (arr!28150 (Array (_ BitVec 32) (_ BitVec 64))) (size!28629 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58553)

(declare-datatypes ((ValueCell!10132 0))(
  ( (ValueCellFull!10132 (v!13221 V!33285)) (EmptyCell!10132) )
))
(declare-datatypes ((array!58555 0))(
  ( (array!58556 (arr!28151 (Array (_ BitVec 32) ValueCell!10132)) (size!28630 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58555)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33285)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13750 0))(
  ( (tuple2!13751 (_1!6886 (_ BitVec 64)) (_2!6886 V!33285)) )
))
(declare-datatypes ((List!19571 0))(
  ( (Nil!19568) (Cons!19567 (h!20729 tuple2!13750) (t!27934 List!19571)) )
))
(declare-datatypes ((ListLongMap!12447 0))(
  ( (ListLongMap!12448 (toList!6239 List!19571)) )
))
(declare-fun contains!5340 (ListLongMap!12447 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3472 (array!58553 array!58555 (_ BitVec 32) (_ BitVec 32) V!33285 V!33285 (_ BitVec 32) Int) ListLongMap!12447)

(assert (=> b!958712 (= lt!430473 (contains!5340 (getCurrentListMap!3472 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28150 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33820 () Bool)

(declare-fun mapRes!33820 () Bool)

(declare-fun tp!64523 () Bool)

(declare-fun e!540479 () Bool)

(assert (=> mapNonEmpty!33820 (= mapRes!33820 (and tp!64523 e!540479))))

(declare-fun mapRest!33820 () (Array (_ BitVec 32) ValueCell!10132))

(declare-fun mapKey!33820 () (_ BitVec 32))

(declare-fun mapValue!33820 () ValueCell!10132)

(assert (=> mapNonEmpty!33820 (= (arr!28151 _values!1386) (store mapRest!33820 mapKey!33820 mapValue!33820))))

(declare-fun b!958713 () Bool)

(declare-fun res!641732 () Bool)

(assert (=> b!958713 (=> (not res!641732) (not e!540477))))

(assert (=> b!958713 (= res!641732 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28629 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28629 _keys!1668))))))

(declare-fun res!641731 () Bool)

(assert (=> start!82248 (=> (not res!641731) (not e!540477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82248 (= res!641731 (validMask!0 mask!2088))))

(assert (=> start!82248 e!540477))

(assert (=> start!82248 true))

(declare-fun tp_is_empty!21227 () Bool)

(assert (=> start!82248 tp_is_empty!21227))

(declare-fun array_inv!21829 (array!58553) Bool)

(assert (=> start!82248 (array_inv!21829 _keys!1668)))

(declare-fun e!540478 () Bool)

(declare-fun array_inv!21830 (array!58555) Bool)

(assert (=> start!82248 (and (array_inv!21830 _values!1386) e!540478)))

(assert (=> start!82248 tp!64524))

(declare-fun b!958714 () Bool)

(assert (=> b!958714 (= e!540479 tp_is_empty!21227)))

(declare-fun b!958715 () Bool)

(declare-fun e!540480 () Bool)

(assert (=> b!958715 (= e!540480 tp_is_empty!21227)))

(declare-fun b!958716 () Bool)

(assert (=> b!958716 (= e!540478 (and e!540480 mapRes!33820))))

(declare-fun condMapEmpty!33820 () Bool)

(declare-fun mapDefault!33820 () ValueCell!10132)

