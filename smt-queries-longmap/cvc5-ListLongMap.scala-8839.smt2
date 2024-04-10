; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107258 () Bool)

(assert start!107258)

(declare-fun b!1271345 () Bool)

(declare-fun e!724936 () Bool)

(declare-fun tp_is_empty!32947 () Bool)

(assert (=> b!1271345 (= e!724936 tp_is_empty!32947)))

(declare-fun b!1271346 () Bool)

(declare-fun res!845866 () Bool)

(declare-fun e!724934 () Bool)

(assert (=> b!1271346 (=> (not res!845866) (not e!724934))))

(declare-datatypes ((array!83144 0))(
  ( (array!83145 (arr!40109 (Array (_ BitVec 32) (_ BitVec 64))) (size!40645 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83144)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83144 (_ BitVec 32)) Bool)

(assert (=> b!1271346 (= res!845866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!51001 () Bool)

(declare-fun mapRes!51001 () Bool)

(assert (=> mapIsEmpty!51001 mapRes!51001))

(declare-fun b!1271347 () Bool)

(declare-fun res!845865 () Bool)

(assert (=> b!1271347 (=> (not res!845865) (not e!724934))))

(declare-datatypes ((V!49123 0))(
  ( (V!49124 (val!16548 Int)) )
))
(declare-datatypes ((ValueCell!15620 0))(
  ( (ValueCellFull!15620 (v!19185 V!49123)) (EmptyCell!15620) )
))
(declare-datatypes ((array!83146 0))(
  ( (array!83147 (arr!40110 (Array (_ BitVec 32) ValueCell!15620)) (size!40646 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83146)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271347 (= res!845865 (and (= (size!40646 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40645 _keys!1364) (size!40646 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271349 () Bool)

(declare-fun e!724938 () Bool)

(assert (=> b!1271349 (= e!724938 tp_is_empty!32947)))

(declare-fun res!845867 () Bool)

(assert (=> start!107258 (=> (not res!845867) (not e!724934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107258 (= res!845867 (validMask!0 mask!1730))))

(assert (=> start!107258 e!724934))

(declare-fun e!724935 () Bool)

(declare-fun array_inv!30507 (array!83146) Bool)

(assert (=> start!107258 (and (array_inv!30507 _values!1134) e!724935)))

(assert (=> start!107258 true))

(declare-fun array_inv!30508 (array!83144) Bool)

(assert (=> start!107258 (array_inv!30508 _keys!1364)))

(declare-fun b!1271348 () Bool)

(assert (=> b!1271348 (= e!724934 false)))

(declare-fun lt!574857 () Bool)

(declare-datatypes ((List!28520 0))(
  ( (Nil!28517) (Cons!28516 (h!29725 (_ BitVec 64)) (t!42049 List!28520)) )
))
(declare-fun arrayNoDuplicates!0 (array!83144 (_ BitVec 32) List!28520) Bool)

(assert (=> b!1271348 (= lt!574857 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28517))))

(declare-fun mapNonEmpty!51001 () Bool)

(declare-fun tp!97342 () Bool)

(assert (=> mapNonEmpty!51001 (= mapRes!51001 (and tp!97342 e!724938))))

(declare-fun mapKey!51001 () (_ BitVec 32))

(declare-fun mapValue!51001 () ValueCell!15620)

(declare-fun mapRest!51001 () (Array (_ BitVec 32) ValueCell!15620))

(assert (=> mapNonEmpty!51001 (= (arr!40110 _values!1134) (store mapRest!51001 mapKey!51001 mapValue!51001))))

(declare-fun b!1271350 () Bool)

(assert (=> b!1271350 (= e!724935 (and e!724936 mapRes!51001))))

(declare-fun condMapEmpty!51001 () Bool)

(declare-fun mapDefault!51001 () ValueCell!15620)

