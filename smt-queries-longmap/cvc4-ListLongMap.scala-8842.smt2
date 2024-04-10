; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107280 () Bool)

(assert start!107280)

(declare-fun b!1271543 () Bool)

(declare-fun res!845965 () Bool)

(declare-fun e!725103 () Bool)

(assert (=> b!1271543 (=> (not res!845965) (not e!725103))))

(declare-datatypes ((array!83186 0))(
  ( (array!83187 (arr!40130 (Array (_ BitVec 32) (_ BitVec 64))) (size!40666 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83186)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83186 (_ BitVec 32)) Bool)

(assert (=> b!1271543 (= res!845965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271544 () Bool)

(declare-fun res!845964 () Bool)

(assert (=> b!1271544 (=> (not res!845964) (not e!725103))))

(declare-datatypes ((V!49151 0))(
  ( (V!49152 (val!16559 Int)) )
))
(declare-datatypes ((ValueCell!15631 0))(
  ( (ValueCellFull!15631 (v!19196 V!49151)) (EmptyCell!15631) )
))
(declare-datatypes ((array!83188 0))(
  ( (array!83189 (arr!40131 (Array (_ BitVec 32) ValueCell!15631)) (size!40667 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83188)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271544 (= res!845964 (and (= (size!40667 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40666 _keys!1364) (size!40667 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271545 () Bool)

(declare-fun e!725102 () Bool)

(declare-fun tp_is_empty!32969 () Bool)

(assert (=> b!1271545 (= e!725102 tp_is_empty!32969)))

(declare-fun mapNonEmpty!51034 () Bool)

(declare-fun mapRes!51034 () Bool)

(declare-fun tp!97375 () Bool)

(assert (=> mapNonEmpty!51034 (= mapRes!51034 (and tp!97375 e!725102))))

(declare-fun mapRest!51034 () (Array (_ BitVec 32) ValueCell!15631))

(declare-fun mapValue!51034 () ValueCell!15631)

(declare-fun mapKey!51034 () (_ BitVec 32))

(assert (=> mapNonEmpty!51034 (= (arr!40131 _values!1134) (store mapRest!51034 mapKey!51034 mapValue!51034))))

(declare-fun res!845966 () Bool)

(assert (=> start!107280 (=> (not res!845966) (not e!725103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107280 (= res!845966 (validMask!0 mask!1730))))

(assert (=> start!107280 e!725103))

(declare-fun e!725099 () Bool)

(declare-fun array_inv!30523 (array!83188) Bool)

(assert (=> start!107280 (and (array_inv!30523 _values!1134) e!725099)))

(assert (=> start!107280 true))

(declare-fun array_inv!30524 (array!83186) Bool)

(assert (=> start!107280 (array_inv!30524 _keys!1364)))

(declare-fun mapIsEmpty!51034 () Bool)

(assert (=> mapIsEmpty!51034 mapRes!51034))

(declare-fun b!1271546 () Bool)

(assert (=> b!1271546 (= e!725103 false)))

(declare-fun lt!574890 () Bool)

(declare-datatypes ((List!28530 0))(
  ( (Nil!28527) (Cons!28526 (h!29735 (_ BitVec 64)) (t!42059 List!28530)) )
))
(declare-fun arrayNoDuplicates!0 (array!83186 (_ BitVec 32) List!28530) Bool)

(assert (=> b!1271546 (= lt!574890 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28527))))

(declare-fun b!1271547 () Bool)

(declare-fun e!725100 () Bool)

(assert (=> b!1271547 (= e!725100 tp_is_empty!32969)))

(declare-fun b!1271548 () Bool)

(assert (=> b!1271548 (= e!725099 (and e!725100 mapRes!51034))))

(declare-fun condMapEmpty!51034 () Bool)

(declare-fun mapDefault!51034 () ValueCell!15631)

