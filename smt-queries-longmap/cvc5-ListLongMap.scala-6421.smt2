; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82322 () Bool)

(assert start!82322)

(declare-fun b_free!18589 () Bool)

(declare-fun b_next!18589 () Bool)

(assert (=> start!82322 (= b_free!18589 (not b_next!18589))))

(declare-fun tp!64737 () Bool)

(declare-fun b_and!30077 () Bool)

(assert (=> start!82322 (= tp!64737 b_and!30077)))

(declare-fun mapIsEmpty!33931 () Bool)

(declare-fun mapRes!33931 () Bool)

(assert (=> mapIsEmpty!33931 mapRes!33931))

(declare-fun res!642458 () Bool)

(declare-fun e!541035 () Bool)

(assert (=> start!82322 (=> (not res!642458) (not e!541035))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82322 (= res!642458 (validMask!0 mask!2088))))

(assert (=> start!82322 e!541035))

(assert (=> start!82322 true))

(declare-fun tp_is_empty!21301 () Bool)

(assert (=> start!82322 tp_is_empty!21301))

(declare-datatypes ((array!58693 0))(
  ( (array!58694 (arr!28220 (Array (_ BitVec 32) (_ BitVec 64))) (size!28699 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58693)

(declare-fun array_inv!21871 (array!58693) Bool)

(assert (=> start!82322 (array_inv!21871 _keys!1668)))

(declare-datatypes ((V!33385 0))(
  ( (V!33386 (val!10701 Int)) )
))
(declare-datatypes ((ValueCell!10169 0))(
  ( (ValueCellFull!10169 (v!13258 V!33385)) (EmptyCell!10169) )
))
(declare-datatypes ((array!58695 0))(
  ( (array!58696 (arr!28221 (Array (_ BitVec 32) ValueCell!10169)) (size!28700 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58695)

(declare-fun e!541034 () Bool)

(declare-fun array_inv!21872 (array!58695) Bool)

(assert (=> start!82322 (and (array_inv!21872 _values!1386) e!541034)))

(assert (=> start!82322 tp!64737))

(declare-fun b!959774 () Bool)

(assert (=> b!959774 (= e!541035 false)))

(declare-fun minValue!1328 () V!33385)

(declare-fun lt!430575 () Bool)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33385)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13802 0))(
  ( (tuple2!13803 (_1!6912 (_ BitVec 64)) (_2!6912 V!33385)) )
))
(declare-datatypes ((List!19622 0))(
  ( (Nil!19619) (Cons!19618 (h!20780 tuple2!13802) (t!27985 List!19622)) )
))
(declare-datatypes ((ListLongMap!12499 0))(
  ( (ListLongMap!12500 (toList!6265 List!19622)) )
))
(declare-fun contains!5364 (ListLongMap!12499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3498 (array!58693 array!58695 (_ BitVec 32) (_ BitVec 32) V!33385 V!33385 (_ BitVec 32) Int) ListLongMap!12499)

(assert (=> b!959774 (= lt!430575 (contains!5364 (getCurrentListMap!3498 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28220 _keys!1668) i!793)))))

(declare-fun b!959775 () Bool)

(declare-fun res!642461 () Bool)

(assert (=> b!959775 (=> (not res!642461) (not e!541035))))

(assert (=> b!959775 (= res!642461 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28699 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28699 _keys!1668))))))

(declare-fun b!959776 () Bool)

(declare-fun e!541032 () Bool)

(assert (=> b!959776 (= e!541032 tp_is_empty!21301)))

(declare-fun b!959777 () Bool)

(declare-fun res!642459 () Bool)

(assert (=> b!959777 (=> (not res!642459) (not e!541035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959777 (= res!642459 (validKeyInArray!0 (select (arr!28220 _keys!1668) i!793)))))

(declare-fun b!959778 () Bool)

(assert (=> b!959778 (= e!541034 (and e!541032 mapRes!33931))))

(declare-fun condMapEmpty!33931 () Bool)

(declare-fun mapDefault!33931 () ValueCell!10169)

