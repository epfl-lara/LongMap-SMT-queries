; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82364 () Bool)

(assert start!82364)

(declare-fun b_free!18631 () Bool)

(declare-fun b_next!18631 () Bool)

(assert (=> start!82364 (= b_free!18631 (not b_next!18631))))

(declare-fun tp!64863 () Bool)

(declare-fun b_and!30119 () Bool)

(assert (=> start!82364 (= tp!64863 b_and!30119)))

(declare-fun b!960341 () Bool)

(declare-fun e!541350 () Bool)

(declare-fun tp_is_empty!21343 () Bool)

(assert (=> b!960341 (= e!541350 tp_is_empty!21343)))

(declare-fun b!960342 () Bool)

(declare-fun e!541346 () Bool)

(assert (=> b!960342 (= e!541346 tp_is_empty!21343)))

(declare-fun b!960343 () Bool)

(declare-fun res!642839 () Bool)

(declare-fun e!541349 () Bool)

(assert (=> b!960343 (=> (not res!642839) (not e!541349))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58777 0))(
  ( (array!58778 (arr!28262 (Array (_ BitVec 32) (_ BitVec 64))) (size!28741 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58777)

(declare-datatypes ((V!33441 0))(
  ( (V!33442 (val!10722 Int)) )
))
(declare-datatypes ((ValueCell!10190 0))(
  ( (ValueCellFull!10190 (v!13279 V!33441)) (EmptyCell!10190) )
))
(declare-datatypes ((array!58779 0))(
  ( (array!58780 (arr!28263 (Array (_ BitVec 32) ValueCell!10190)) (size!28742 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58779)

(assert (=> b!960343 (= res!642839 (and (= (size!28742 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28741 _keys!1668) (size!28742 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960344 () Bool)

(declare-fun res!642837 () Bool)

(assert (=> b!960344 (=> (not res!642837) (not e!541349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58777 (_ BitVec 32)) Bool)

(assert (=> b!960344 (= res!642837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!642834 () Bool)

(assert (=> start!82364 (=> (not res!642834) (not e!541349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82364 (= res!642834 (validMask!0 mask!2088))))

(assert (=> start!82364 e!541349))

(assert (=> start!82364 true))

(assert (=> start!82364 tp_is_empty!21343))

(declare-fun array_inv!21899 (array!58777) Bool)

(assert (=> start!82364 (array_inv!21899 _keys!1668)))

(declare-fun e!541348 () Bool)

(declare-fun array_inv!21900 (array!58779) Bool)

(assert (=> start!82364 (and (array_inv!21900 _values!1386) e!541348)))

(assert (=> start!82364 tp!64863))

(declare-fun b!960345 () Bool)

(declare-fun res!642836 () Bool)

(assert (=> b!960345 (=> (not res!642836) (not e!541349))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960345 (= res!642836 (validKeyInArray!0 (select (arr!28262 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33994 () Bool)

(declare-fun mapRes!33994 () Bool)

(assert (=> mapIsEmpty!33994 mapRes!33994))

(declare-fun b!960346 () Bool)

(assert (=> b!960346 (= e!541348 (and e!541346 mapRes!33994))))

(declare-fun condMapEmpty!33994 () Bool)

(declare-fun mapDefault!33994 () ValueCell!10190)

