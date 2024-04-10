; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82376 () Bool)

(assert start!82376)

(declare-fun b_free!18643 () Bool)

(declare-fun b_next!18643 () Bool)

(assert (=> start!82376 (= b_free!18643 (not b_next!18643))))

(declare-fun tp!64899 () Bool)

(declare-fun b_and!30131 () Bool)

(assert (=> start!82376 (= tp!64899 b_and!30131)))

(declare-fun mapIsEmpty!34012 () Bool)

(declare-fun mapRes!34012 () Bool)

(assert (=> mapIsEmpty!34012 mapRes!34012))

(declare-fun b!960503 () Bool)

(declare-fun res!642942 () Bool)

(declare-fun e!541438 () Bool)

(assert (=> b!960503 (=> (not res!642942) (not e!541438))))

(declare-datatypes ((array!58799 0))(
  ( (array!58800 (arr!28273 (Array (_ BitVec 32) (_ BitVec 64))) (size!28752 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58799)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960503 (= res!642942 (validKeyInArray!0 (select (arr!28273 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!34012 () Bool)

(declare-fun tp!64898 () Bool)

(declare-fun e!541440 () Bool)

(assert (=> mapNonEmpty!34012 (= mapRes!34012 (and tp!64898 e!541440))))

(declare-datatypes ((V!33457 0))(
  ( (V!33458 (val!10728 Int)) )
))
(declare-datatypes ((ValueCell!10196 0))(
  ( (ValueCellFull!10196 (v!13285 V!33457)) (EmptyCell!10196) )
))
(declare-fun mapValue!34012 () ValueCell!10196)

(declare-fun mapRest!34012 () (Array (_ BitVec 32) ValueCell!10196))

(declare-datatypes ((array!58801 0))(
  ( (array!58802 (arr!28274 (Array (_ BitVec 32) ValueCell!10196)) (size!28753 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58801)

(declare-fun mapKey!34012 () (_ BitVec 32))

(assert (=> mapNonEmpty!34012 (= (arr!28274 _values!1386) (store mapRest!34012 mapKey!34012 mapValue!34012))))

(declare-fun b!960504 () Bool)

(declare-fun res!642944 () Bool)

(assert (=> b!960504 (=> (not res!642944) (not e!541438))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960504 (= res!642944 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28752 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28752 _keys!1668))))))

(declare-fun b!960505 () Bool)

(declare-fun tp_is_empty!21355 () Bool)

(assert (=> b!960505 (= e!541440 tp_is_empty!21355)))

(declare-fun res!642946 () Bool)

(assert (=> start!82376 (=> (not res!642946) (not e!541438))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82376 (= res!642946 (validMask!0 mask!2088))))

(assert (=> start!82376 e!541438))

(assert (=> start!82376 true))

(assert (=> start!82376 tp_is_empty!21355))

(declare-fun array_inv!21909 (array!58799) Bool)

(assert (=> start!82376 (array_inv!21909 _keys!1668)))

(declare-fun e!541439 () Bool)

(declare-fun array_inv!21910 (array!58801) Bool)

(assert (=> start!82376 (and (array_inv!21910 _values!1386) e!541439)))

(assert (=> start!82376 tp!64899))

(declare-fun b!960506 () Bool)

(declare-fun res!642947 () Bool)

(assert (=> b!960506 (=> (not res!642947) (not e!541438))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!960506 (= res!642947 (and (= (size!28753 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28752 _keys!1668) (size!28753 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960507 () Bool)

(declare-fun e!541436 () Bool)

(assert (=> b!960507 (= e!541439 (and e!541436 mapRes!34012))))

(declare-fun condMapEmpty!34012 () Bool)

(declare-fun mapDefault!34012 () ValueCell!10196)

