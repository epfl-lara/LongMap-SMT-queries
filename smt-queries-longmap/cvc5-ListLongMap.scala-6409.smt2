; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82250 () Bool)

(assert start!82250)

(declare-fun b_free!18523 () Bool)

(declare-fun b_next!18523 () Bool)

(assert (=> start!82250 (= b_free!18523 (not b_next!18523))))

(declare-fun tp!64529 () Bool)

(declare-fun b_and!30011 () Bool)

(assert (=> start!82250 (= tp!64529 b_and!30011)))

(declare-fun b!958739 () Bool)

(declare-fun res!641747 () Bool)

(declare-fun e!540495 () Bool)

(assert (=> b!958739 (=> (not res!641747) (not e!540495))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58557 0))(
  ( (array!58558 (arr!28152 (Array (_ BitVec 32) (_ BitVec 64))) (size!28631 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58557)

(declare-datatypes ((V!33289 0))(
  ( (V!33290 (val!10665 Int)) )
))
(declare-datatypes ((ValueCell!10133 0))(
  ( (ValueCellFull!10133 (v!13222 V!33289)) (EmptyCell!10133) )
))
(declare-datatypes ((array!58559 0))(
  ( (array!58560 (arr!28153 (Array (_ BitVec 32) ValueCell!10133)) (size!28632 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58559)

(assert (=> b!958739 (= res!641747 (and (= (size!28632 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28631 _keys!1668) (size!28632 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958740 () Bool)

(declare-fun res!641746 () Bool)

(assert (=> b!958740 (=> (not res!641746) (not e!540495))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958740 (= res!641746 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28631 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28631 _keys!1668))))))

(declare-fun mapNonEmpty!33823 () Bool)

(declare-fun mapRes!33823 () Bool)

(declare-fun tp!64530 () Bool)

(declare-fun e!540494 () Bool)

(assert (=> mapNonEmpty!33823 (= mapRes!33823 (and tp!64530 e!540494))))

(declare-fun mapRest!33823 () (Array (_ BitVec 32) ValueCell!10133))

(declare-fun mapKey!33823 () (_ BitVec 32))

(declare-fun mapValue!33823 () ValueCell!10133)

(assert (=> mapNonEmpty!33823 (= (arr!28153 _values!1386) (store mapRest!33823 mapKey!33823 mapValue!33823))))

(declare-fun b!958741 () Bool)

(declare-fun e!540492 () Bool)

(declare-fun tp_is_empty!21229 () Bool)

(assert (=> b!958741 (= e!540492 tp_is_empty!21229)))

(declare-fun b!958742 () Bool)

(declare-fun e!540491 () Bool)

(assert (=> b!958742 (= e!540491 (and e!540492 mapRes!33823))))

(declare-fun condMapEmpty!33823 () Bool)

(declare-fun mapDefault!33823 () ValueCell!10133)

