; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82226 () Bool)

(assert start!82226)

(declare-fun b_free!18499 () Bool)

(declare-fun b_next!18499 () Bool)

(assert (=> start!82226 (= b_free!18499 (not b_next!18499))))

(declare-fun tp!64457 () Bool)

(declare-fun b_and!29987 () Bool)

(assert (=> start!82226 (= tp!64457 b_and!29987)))

(declare-fun b!958415 () Bool)

(declare-fun e!540312 () Bool)

(declare-fun tp_is_empty!21205 () Bool)

(assert (=> b!958415 (= e!540312 tp_is_empty!21205)))

(declare-fun mapNonEmpty!33787 () Bool)

(declare-fun mapRes!33787 () Bool)

(declare-fun tp!64458 () Bool)

(assert (=> mapNonEmpty!33787 (= mapRes!33787 (and tp!64458 e!540312))))

(declare-fun mapKey!33787 () (_ BitVec 32))

(declare-datatypes ((V!33257 0))(
  ( (V!33258 (val!10653 Int)) )
))
(declare-datatypes ((ValueCell!10121 0))(
  ( (ValueCellFull!10121 (v!13210 V!33257)) (EmptyCell!10121) )
))
(declare-fun mapValue!33787 () ValueCell!10121)

(declare-datatypes ((array!58511 0))(
  ( (array!58512 (arr!28129 (Array (_ BitVec 32) ValueCell!10121)) (size!28608 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58511)

(declare-fun mapRest!33787 () (Array (_ BitVec 32) ValueCell!10121))

(assert (=> mapNonEmpty!33787 (= (arr!28129 _values!1386) (store mapRest!33787 mapKey!33787 mapValue!33787))))

(declare-fun res!641529 () Bool)

(declare-fun e!540315 () Bool)

(assert (=> start!82226 (=> (not res!641529) (not e!540315))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82226 (= res!641529 (validMask!0 mask!2088))))

(assert (=> start!82226 e!540315))

(assert (=> start!82226 true))

(assert (=> start!82226 tp_is_empty!21205))

(declare-datatypes ((array!58513 0))(
  ( (array!58514 (arr!28130 (Array (_ BitVec 32) (_ BitVec 64))) (size!28609 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58513)

(declare-fun array_inv!21817 (array!58513) Bool)

(assert (=> start!82226 (array_inv!21817 _keys!1668)))

(declare-fun e!540314 () Bool)

(declare-fun array_inv!21818 (array!58511) Bool)

(assert (=> start!82226 (and (array_inv!21818 _values!1386) e!540314)))

(assert (=> start!82226 tp!64457))

(declare-fun b!958416 () Bool)

(declare-fun res!641531 () Bool)

(assert (=> b!958416 (=> (not res!641531) (not e!540315))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958416 (= res!641531 (validKeyInArray!0 (select (arr!28130 _keys!1668) i!793)))))

(declare-fun b!958417 () Bool)

(declare-fun res!641530 () Bool)

(assert (=> b!958417 (=> (not res!641530) (not e!540315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58513 (_ BitVec 32)) Bool)

(assert (=> b!958417 (= res!641530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958418 () Bool)

(declare-fun res!641534 () Bool)

(assert (=> b!958418 (=> (not res!641534) (not e!540315))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958418 (= res!641534 (and (= (size!28608 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28609 _keys!1668) (size!28608 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33787 () Bool)

(assert (=> mapIsEmpty!33787 mapRes!33787))

(declare-fun b!958419 () Bool)

(declare-fun res!641533 () Bool)

(assert (=> b!958419 (=> (not res!641533) (not e!540315))))

(declare-datatypes ((List!19555 0))(
  ( (Nil!19552) (Cons!19551 (h!20713 (_ BitVec 64)) (t!27918 List!19555)) )
))
(declare-fun arrayNoDuplicates!0 (array!58513 (_ BitVec 32) List!19555) Bool)

(assert (=> b!958419 (= res!641533 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19552))))

(declare-fun b!958420 () Bool)

(declare-fun e!540311 () Bool)

(assert (=> b!958420 (= e!540314 (and e!540311 mapRes!33787))))

(declare-fun condMapEmpty!33787 () Bool)

(declare-fun mapDefault!33787 () ValueCell!10121)

