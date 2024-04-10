; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35846 () Bool)

(assert start!35846)

(declare-fun b!360282 () Bool)

(declare-fun res!200346 () Bool)

(declare-fun e!220619 () Bool)

(assert (=> b!360282 (=> (not res!200346) (not e!220619))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20149 0))(
  ( (array!20150 (arr!9568 (Array (_ BitVec 32) (_ BitVec 64))) (size!9920 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20149)

(declare-datatypes ((V!12043 0))(
  ( (V!12044 (val!4194 Int)) )
))
(declare-datatypes ((ValueCell!3806 0))(
  ( (ValueCellFull!3806 (v!6388 V!12043)) (EmptyCell!3806) )
))
(declare-datatypes ((array!20151 0))(
  ( (array!20152 (arr!9569 (Array (_ BitVec 32) ValueCell!3806)) (size!9921 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20151)

(assert (=> b!360282 (= res!200346 (and (= (size!9921 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9920 _keys!1456) (size!9921 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360283 () Bool)

(declare-fun res!200341 () Bool)

(assert (=> b!360283 (=> (not res!200341) (not e!220619))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360283 (= res!200341 (validKeyInArray!0 k!1077))))

(declare-fun b!360284 () Bool)

(assert (=> b!360284 (= e!220619 (not true))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360284 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12043)

(declare-datatypes ((Unit!11080 0))(
  ( (Unit!11081) )
))
(declare-fun lt!166436 () Unit!11080)

(declare-fun zeroValue!1150 () V!12043)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!55 (array!20149 array!20151 (_ BitVec 32) (_ BitVec 32) V!12043 V!12043 (_ BitVec 64) (_ BitVec 32)) Unit!11080)

(assert (=> b!360284 (= lt!166436 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!55 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun res!200340 () Bool)

(assert (=> start!35846 (=> (not res!200340) (not e!220619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35846 (= res!200340 (validMask!0 mask!1842))))

(assert (=> start!35846 e!220619))

(declare-fun tp_is_empty!8299 () Bool)

(assert (=> start!35846 tp_is_empty!8299))

(assert (=> start!35846 true))

(declare-fun array_inv!7036 (array!20149) Bool)

(assert (=> start!35846 (array_inv!7036 _keys!1456)))

(declare-fun e!220618 () Bool)

(declare-fun array_inv!7037 (array!20151) Bool)

(assert (=> start!35846 (and (array_inv!7037 _values!1208) e!220618)))

(declare-fun b!360285 () Bool)

(declare-fun res!200345 () Bool)

(assert (=> b!360285 (=> (not res!200345) (not e!220619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20149 (_ BitVec 32)) Bool)

(assert (=> b!360285 (= res!200345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360286 () Bool)

(declare-fun e!220621 () Bool)

(declare-fun mapRes!13956 () Bool)

(assert (=> b!360286 (= e!220618 (and e!220621 mapRes!13956))))

(declare-fun condMapEmpty!13956 () Bool)

(declare-fun mapDefault!13956 () ValueCell!3806)

