; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106980 () Bool)

(assert start!106980)

(declare-fun mapNonEmpty!50584 () Bool)

(declare-fun mapRes!50584 () Bool)

(declare-fun tp!96763 () Bool)

(declare-fun e!722853 () Bool)

(assert (=> mapNonEmpty!50584 (= mapRes!50584 (and tp!96763 e!722853))))

(declare-datatypes ((V!48751 0))(
  ( (V!48752 (val!16409 Int)) )
))
(declare-datatypes ((ValueCell!15481 0))(
  ( (ValueCellFull!15481 (v!19046 V!48751)) (EmptyCell!15481) )
))
(declare-datatypes ((array!82612 0))(
  ( (array!82613 (arr!39843 (Array (_ BitVec 32) ValueCell!15481)) (size!40379 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82612)

(declare-fun mapValue!50584 () ValueCell!15481)

(declare-fun mapRest!50584 () (Array (_ BitVec 32) ValueCell!15481))

(declare-fun mapKey!50584 () (_ BitVec 32))

(assert (=> mapNonEmpty!50584 (= (arr!39843 _values!1134) (store mapRest!50584 mapKey!50584 mapValue!50584))))

(declare-fun b!1268519 () Bool)

(declare-fun res!844290 () Bool)

(declare-fun e!722852 () Bool)

(assert (=> b!1268519 (=> (not res!844290) (not e!722852))))

(declare-datatypes ((array!82614 0))(
  ( (array!82615 (arr!39844 (Array (_ BitVec 32) (_ BitVec 64))) (size!40380 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82614)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82614 (_ BitVec 32)) Bool)

(assert (=> b!1268519 (= res!844290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50584 () Bool)

(assert (=> mapIsEmpty!50584 mapRes!50584))

(declare-fun b!1268520 () Bool)

(assert (=> b!1268520 (= e!722852 false)))

(declare-fun lt!574440 () Bool)

(declare-datatypes ((List!28385 0))(
  ( (Nil!28382) (Cons!28381 (h!29590 (_ BitVec 64)) (t!41914 List!28385)) )
))
(declare-fun arrayNoDuplicates!0 (array!82614 (_ BitVec 32) List!28385) Bool)

(assert (=> b!1268520 (= lt!574440 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28382))))

(declare-fun b!1268521 () Bool)

(declare-fun e!722849 () Bool)

(declare-fun e!722850 () Bool)

(assert (=> b!1268521 (= e!722849 (and e!722850 mapRes!50584))))

(declare-fun condMapEmpty!50584 () Bool)

(declare-fun mapDefault!50584 () ValueCell!15481)

