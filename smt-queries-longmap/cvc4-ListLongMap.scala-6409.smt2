; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82254 () Bool)

(assert start!82254)

(declare-fun b_free!18527 () Bool)

(declare-fun b_next!18527 () Bool)

(assert (=> start!82254 (= b_free!18527 (not b_next!18527))))

(declare-fun tp!64541 () Bool)

(declare-fun b_and!30015 () Bool)

(assert (=> start!82254 (= tp!64541 b_and!30015)))

(declare-fun b!958793 () Bool)

(declare-fun res!641786 () Bool)

(declare-fun e!540524 () Bool)

(assert (=> b!958793 (=> (not res!641786) (not e!540524))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58565 0))(
  ( (array!58566 (arr!28156 (Array (_ BitVec 32) (_ BitVec 64))) (size!28635 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58565)

(declare-datatypes ((V!33293 0))(
  ( (V!33294 (val!10667 Int)) )
))
(declare-datatypes ((ValueCell!10135 0))(
  ( (ValueCellFull!10135 (v!13224 V!33293)) (EmptyCell!10135) )
))
(declare-datatypes ((array!58567 0))(
  ( (array!58568 (arr!28157 (Array (_ BitVec 32) ValueCell!10135)) (size!28636 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58567)

(assert (=> b!958793 (= res!641786 (and (= (size!28636 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28635 _keys!1668) (size!28636 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958794 () Bool)

(declare-fun e!540521 () Bool)

(declare-fun tp_is_empty!21233 () Bool)

(assert (=> b!958794 (= e!540521 tp_is_empty!21233)))

(declare-fun b!958795 () Bool)

(declare-fun res!641782 () Bool)

(assert (=> b!958795 (=> (not res!641782) (not e!540524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58565 (_ BitVec 32)) Bool)

(assert (=> b!958795 (= res!641782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33829 () Bool)

(declare-fun mapRes!33829 () Bool)

(declare-fun tp!64542 () Bool)

(declare-fun e!540522 () Bool)

(assert (=> mapNonEmpty!33829 (= mapRes!33829 (and tp!64542 e!540522))))

(declare-fun mapValue!33829 () ValueCell!10135)

(declare-fun mapKey!33829 () (_ BitVec 32))

(declare-fun mapRest!33829 () (Array (_ BitVec 32) ValueCell!10135))

(assert (=> mapNonEmpty!33829 (= (arr!28157 _values!1386) (store mapRest!33829 mapKey!33829 mapValue!33829))))

(declare-fun b!958796 () Bool)

(assert (=> b!958796 (= e!540522 tp_is_empty!21233)))

(declare-fun b!958797 () Bool)

(declare-fun res!641781 () Bool)

(assert (=> b!958797 (=> (not res!641781) (not e!540524))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958797 (= res!641781 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28635 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28635 _keys!1668))))))

(declare-fun b!958798 () Bool)

(declare-fun res!641785 () Bool)

(assert (=> b!958798 (=> (not res!641785) (not e!540524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958798 (= res!641785 (validKeyInArray!0 (select (arr!28156 _keys!1668) i!793)))))

(declare-fun b!958799 () Bool)

(declare-fun res!641784 () Bool)

(assert (=> b!958799 (=> (not res!641784) (not e!540524))))

(declare-datatypes ((List!19574 0))(
  ( (Nil!19571) (Cons!19570 (h!20732 (_ BitVec 64)) (t!27937 List!19574)) )
))
(declare-fun arrayNoDuplicates!0 (array!58565 (_ BitVec 32) List!19574) Bool)

(assert (=> b!958799 (= res!641784 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19571))))

(declare-fun b!958800 () Bool)

(declare-fun e!540523 () Bool)

(assert (=> b!958800 (= e!540523 (and e!540521 mapRes!33829))))

(declare-fun condMapEmpty!33829 () Bool)

(declare-fun mapDefault!33829 () ValueCell!10135)

