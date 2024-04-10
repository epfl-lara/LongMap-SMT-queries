; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82786 () Bool)

(assert start!82786)

(declare-fun res!646384 () Bool)

(declare-fun e!544359 () Bool)

(assert (=> start!82786 (=> (not res!646384) (not e!544359))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82786 (= res!646384 (validMask!0 mask!2110))))

(assert (=> start!82786 e!544359))

(assert (=> start!82786 true))

(declare-datatypes ((V!33945 0))(
  ( (V!33946 (val!10911 Int)) )
))
(declare-datatypes ((ValueCell!10379 0))(
  ( (ValueCellFull!10379 (v!13469 V!33945)) (EmptyCell!10379) )
))
(declare-datatypes ((array!59527 0))(
  ( (array!59528 (arr!28632 (Array (_ BitVec 32) ValueCell!10379)) (size!29111 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59527)

(declare-fun e!544361 () Bool)

(declare-fun array_inv!22173 (array!59527) Bool)

(assert (=> start!82786 (and (array_inv!22173 _values!1400) e!544361)))

(declare-datatypes ((array!59529 0))(
  ( (array!59530 (arr!28633 (Array (_ BitVec 32) (_ BitVec 64))) (size!29112 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59529)

(declare-fun array_inv!22174 (array!59529) Bool)

(assert (=> start!82786 (array_inv!22174 _keys!1686)))

(declare-fun mapNonEmpty!34576 () Bool)

(declare-fun mapRes!34576 () Bool)

(declare-fun tp!65874 () Bool)

(declare-fun e!544358 () Bool)

(assert (=> mapNonEmpty!34576 (= mapRes!34576 (and tp!65874 e!544358))))

(declare-fun mapValue!34576 () ValueCell!10379)

(declare-fun mapRest!34576 () (Array (_ BitVec 32) ValueCell!10379))

(declare-fun mapKey!34576 () (_ BitVec 32))

(assert (=> mapNonEmpty!34576 (= (arr!28632 _values!1400) (store mapRest!34576 mapKey!34576 mapValue!34576))))

(declare-fun b!965656 () Bool)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965656 (= e!544359 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29112 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29112 _keys!1686)) (bvslt i!803 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!34576 () Bool)

(assert (=> mapIsEmpty!34576 mapRes!34576))

(declare-fun b!965657 () Bool)

(declare-fun res!646386 () Bool)

(assert (=> b!965657 (=> (not res!646386) (not e!544359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59529 (_ BitVec 32)) Bool)

(assert (=> b!965657 (= res!646386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965658 () Bool)

(declare-fun tp_is_empty!21721 () Bool)

(assert (=> b!965658 (= e!544358 tp_is_empty!21721)))

(declare-fun b!965659 () Bool)

(declare-fun e!544360 () Bool)

(assert (=> b!965659 (= e!544360 tp_is_empty!21721)))

(declare-fun b!965660 () Bool)

(declare-fun res!646385 () Bool)

(assert (=> b!965660 (=> (not res!646385) (not e!544359))))

(declare-datatypes ((List!19877 0))(
  ( (Nil!19874) (Cons!19873 (h!21035 (_ BitVec 64)) (t!28240 List!19877)) )
))
(declare-fun arrayNoDuplicates!0 (array!59529 (_ BitVec 32) List!19877) Bool)

(assert (=> b!965660 (= res!646385 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19874))))

(declare-fun b!965661 () Bool)

(assert (=> b!965661 (= e!544361 (and e!544360 mapRes!34576))))

(declare-fun condMapEmpty!34576 () Bool)

(declare-fun mapDefault!34576 () ValueCell!10379)

