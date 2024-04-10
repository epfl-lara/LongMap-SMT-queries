; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107156 () Bool)

(assert start!107156)

(declare-fun mapNonEmpty!50848 () Bool)

(declare-fun mapRes!50848 () Bool)

(declare-fun tp!97189 () Bool)

(declare-fun e!724173 () Bool)

(assert (=> mapNonEmpty!50848 (= mapRes!50848 (and tp!97189 e!724173))))

(declare-datatypes ((V!48987 0))(
  ( (V!48988 (val!16497 Int)) )
))
(declare-datatypes ((ValueCell!15569 0))(
  ( (ValueCellFull!15569 (v!19134 V!48987)) (EmptyCell!15569) )
))
(declare-datatypes ((array!82952 0))(
  ( (array!82953 (arr!40013 (Array (_ BitVec 32) ValueCell!15569)) (size!40549 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82952)

(declare-fun mapRest!50848 () (Array (_ BitVec 32) ValueCell!15569))

(declare-fun mapKey!50848 () (_ BitVec 32))

(declare-fun mapValue!50848 () ValueCell!15569)

(assert (=> mapNonEmpty!50848 (= (arr!40013 _values!1134) (store mapRest!50848 mapKey!50848 mapValue!50848))))

(declare-fun b!1270427 () Bool)

(declare-fun e!724170 () Bool)

(assert (=> b!1270427 (= e!724170 false)))

(declare-fun lt!574704 () Bool)

(declare-datatypes ((array!82954 0))(
  ( (array!82955 (arr!40014 (Array (_ BitVec 32) (_ BitVec 64))) (size!40550 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82954)

(declare-datatypes ((List!28488 0))(
  ( (Nil!28485) (Cons!28484 (h!29693 (_ BitVec 64)) (t!42017 List!28488)) )
))
(declare-fun arrayNoDuplicates!0 (array!82954 (_ BitVec 32) List!28488) Bool)

(assert (=> b!1270427 (= lt!574704 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28485))))

(declare-fun b!1270429 () Bool)

(declare-fun e!724171 () Bool)

(declare-fun tp_is_empty!32845 () Bool)

(assert (=> b!1270429 (= e!724171 tp_is_empty!32845)))

(declare-fun b!1270430 () Bool)

(declare-fun res!845406 () Bool)

(assert (=> b!1270430 (=> (not res!845406) (not e!724170))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82954 (_ BitVec 32)) Bool)

(assert (=> b!1270430 (= res!845406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50848 () Bool)

(assert (=> mapIsEmpty!50848 mapRes!50848))

(declare-fun res!845408 () Bool)

(assert (=> start!107156 (=> (not res!845408) (not e!724170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107156 (= res!845408 (validMask!0 mask!1730))))

(assert (=> start!107156 e!724170))

(declare-fun e!724169 () Bool)

(declare-fun array_inv!30435 (array!82952) Bool)

(assert (=> start!107156 (and (array_inv!30435 _values!1134) e!724169)))

(assert (=> start!107156 true))

(declare-fun array_inv!30436 (array!82954) Bool)

(assert (=> start!107156 (array_inv!30436 _keys!1364)))

(declare-fun b!1270428 () Bool)

(assert (=> b!1270428 (= e!724169 (and e!724171 mapRes!50848))))

(declare-fun condMapEmpty!50848 () Bool)

(declare-fun mapDefault!50848 () ValueCell!15569)

