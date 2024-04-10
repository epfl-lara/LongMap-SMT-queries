; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107324 () Bool)

(assert start!107324)

(declare-fun mapIsEmpty!51100 () Bool)

(declare-fun mapRes!51100 () Bool)

(assert (=> mapIsEmpty!51100 mapRes!51100))

(declare-fun b!1271950 () Bool)

(declare-fun e!725430 () Bool)

(declare-fun tp_is_empty!33013 () Bool)

(assert (=> b!1271950 (= e!725430 tp_is_empty!33013)))

(declare-fun mapNonEmpty!51100 () Bool)

(declare-fun tp!97441 () Bool)

(assert (=> mapNonEmpty!51100 (= mapRes!51100 (and tp!97441 e!725430))))

(declare-datatypes ((V!49211 0))(
  ( (V!49212 (val!16581 Int)) )
))
(declare-datatypes ((ValueCell!15653 0))(
  ( (ValueCellFull!15653 (v!19218 V!49211)) (EmptyCell!15653) )
))
(declare-datatypes ((array!83274 0))(
  ( (array!83275 (arr!40174 (Array (_ BitVec 32) ValueCell!15653)) (size!40710 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83274)

(declare-fun mapRest!51100 () (Array (_ BitVec 32) ValueCell!15653))

(declare-fun mapKey!51100 () (_ BitVec 32))

(declare-fun mapValue!51100 () ValueCell!15653)

(assert (=> mapNonEmpty!51100 (= (arr!40174 _values!1134) (store mapRest!51100 mapKey!51100 mapValue!51100))))

(declare-fun b!1271951 () Bool)

(declare-fun res!846175 () Bool)

(declare-fun e!725429 () Bool)

(assert (=> b!1271951 (=> (not res!846175) (not e!725429))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83276 0))(
  ( (array!83277 (arr!40175 (Array (_ BitVec 32) (_ BitVec 64))) (size!40711 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83276)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271951 (= res!846175 (and (= (size!40710 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40711 _keys!1364) (size!40710 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271952 () Bool)

(declare-fun res!846173 () Bool)

(assert (=> b!1271952 (=> (not res!846173) (not e!725429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83276 (_ BitVec 32)) Bool)

(assert (=> b!1271952 (= res!846173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271953 () Bool)

(declare-fun e!725432 () Bool)

(assert (=> b!1271953 (= e!725432 tp_is_empty!33013)))

(declare-fun b!1271954 () Bool)

(declare-fun res!846174 () Bool)

(assert (=> b!1271954 (=> (not res!846174) (not e!725429))))

(declare-datatypes ((List!28546 0))(
  ( (Nil!28543) (Cons!28542 (h!29751 (_ BitVec 64)) (t!42075 List!28546)) )
))
(declare-fun arrayNoDuplicates!0 (array!83276 (_ BitVec 32) List!28546) Bool)

(assert (=> b!1271954 (= res!846174 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28543))))

(declare-fun res!846176 () Bool)

(assert (=> start!107324 (=> (not res!846176) (not e!725429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107324 (= res!846176 (validMask!0 mask!1730))))

(assert (=> start!107324 e!725429))

(declare-fun e!725431 () Bool)

(declare-fun array_inv!30559 (array!83274) Bool)

(assert (=> start!107324 (and (array_inv!30559 _values!1134) e!725431)))

(assert (=> start!107324 true))

(declare-fun array_inv!30560 (array!83276) Bool)

(assert (=> start!107324 (array_inv!30560 _keys!1364)))

(declare-fun b!1271955 () Bool)

(assert (=> b!1271955 (= e!725431 (and e!725432 mapRes!51100))))

(declare-fun condMapEmpty!51100 () Bool)

(declare-fun mapDefault!51100 () ValueCell!15653)

