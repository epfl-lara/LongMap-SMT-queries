; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82148 () Bool)

(assert start!82148)

(declare-fun b!957491 () Bool)

(declare-fun res!640956 () Bool)

(declare-fun e!539729 () Bool)

(assert (=> b!957491 (=> (not res!640956) (not e!539729))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58359 0))(
  ( (array!58360 (arr!28053 (Array (_ BitVec 32) (_ BitVec 64))) (size!28532 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58359)

(declare-datatypes ((V!33153 0))(
  ( (V!33154 (val!10614 Int)) )
))
(declare-datatypes ((ValueCell!10082 0))(
  ( (ValueCellFull!10082 (v!13171 V!33153)) (EmptyCell!10082) )
))
(declare-datatypes ((array!58361 0))(
  ( (array!58362 (arr!28054 (Array (_ BitVec 32) ValueCell!10082)) (size!28533 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58361)

(assert (=> b!957491 (= res!640956 (and (= (size!28533 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28532 _keys!1668) (size!28533 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33670 () Bool)

(declare-fun mapRes!33670 () Bool)

(assert (=> mapIsEmpty!33670 mapRes!33670))

(declare-fun mapNonEmpty!33670 () Bool)

(declare-fun tp!64275 () Bool)

(declare-fun e!539730 () Bool)

(assert (=> mapNonEmpty!33670 (= mapRes!33670 (and tp!64275 e!539730))))

(declare-fun mapValue!33670 () ValueCell!10082)

(declare-fun mapKey!33670 () (_ BitVec 32))

(declare-fun mapRest!33670 () (Array (_ BitVec 32) ValueCell!10082))

(assert (=> mapNonEmpty!33670 (= (arr!28054 _values!1386) (store mapRest!33670 mapKey!33670 mapValue!33670))))

(declare-fun b!957492 () Bool)

(declare-fun e!539726 () Bool)

(declare-fun e!539728 () Bool)

(assert (=> b!957492 (= e!539726 (and e!539728 mapRes!33670))))

(declare-fun condMapEmpty!33670 () Bool)

(declare-fun mapDefault!33670 () ValueCell!10082)

