; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82206 () Bool)

(assert start!82206)

(declare-fun b_free!18479 () Bool)

(declare-fun b_next!18479 () Bool)

(assert (=> start!82206 (= b_free!18479 (not b_next!18479))))

(declare-fun tp!64398 () Bool)

(declare-fun b_and!29967 () Bool)

(assert (=> start!82206 (= tp!64398 b_and!29967)))

(declare-fun b!958145 () Bool)

(declare-fun res!641349 () Bool)

(declare-fun e!540162 () Bool)

(assert (=> b!958145 (=> (not res!641349) (not e!540162))))

(declare-datatypes ((array!58473 0))(
  ( (array!58474 (arr!28110 (Array (_ BitVec 32) (_ BitVec 64))) (size!28589 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58473)

(declare-datatypes ((List!19543 0))(
  ( (Nil!19540) (Cons!19539 (h!20701 (_ BitVec 64)) (t!27906 List!19543)) )
))
(declare-fun arrayNoDuplicates!0 (array!58473 (_ BitVec 32) List!19543) Bool)

(assert (=> b!958145 (= res!641349 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19540))))

(declare-fun mapNonEmpty!33757 () Bool)

(declare-fun mapRes!33757 () Bool)

(declare-fun tp!64397 () Bool)

(declare-fun e!540161 () Bool)

(assert (=> mapNonEmpty!33757 (= mapRes!33757 (and tp!64397 e!540161))))

(declare-datatypes ((V!33229 0))(
  ( (V!33230 (val!10643 Int)) )
))
(declare-datatypes ((ValueCell!10111 0))(
  ( (ValueCellFull!10111 (v!13200 V!33229)) (EmptyCell!10111) )
))
(declare-fun mapRest!33757 () (Array (_ BitVec 32) ValueCell!10111))

(declare-fun mapKey!33757 () (_ BitVec 32))

(declare-fun mapValue!33757 () ValueCell!10111)

(declare-datatypes ((array!58475 0))(
  ( (array!58476 (arr!28111 (Array (_ BitVec 32) ValueCell!10111)) (size!28590 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58475)

(assert (=> mapNonEmpty!33757 (= (arr!28111 _values!1386) (store mapRest!33757 mapKey!33757 mapValue!33757))))

(declare-fun b!958147 () Bool)

(declare-fun e!540165 () Bool)

(declare-fun tp_is_empty!21185 () Bool)

(assert (=> b!958147 (= e!540165 tp_is_empty!21185)))

(declare-fun b!958148 () Bool)

(declare-fun res!641350 () Bool)

(assert (=> b!958148 (=> (not res!641350) (not e!540162))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58473 (_ BitVec 32)) Bool)

(assert (=> b!958148 (= res!641350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958149 () Bool)

(declare-fun e!540164 () Bool)

(assert (=> b!958149 (= e!540164 (and e!540165 mapRes!33757))))

(declare-fun condMapEmpty!33757 () Bool)

(declare-fun mapDefault!33757 () ValueCell!10111)

