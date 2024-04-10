; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107186 () Bool)

(assert start!107186)

(declare-fun res!845541 () Bool)

(declare-fun e!724398 () Bool)

(assert (=> start!107186 (=> (not res!845541) (not e!724398))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107186 (= res!845541 (validMask!0 mask!1730))))

(assert (=> start!107186 e!724398))

(declare-datatypes ((V!49027 0))(
  ( (V!49028 (val!16512 Int)) )
))
(declare-datatypes ((ValueCell!15584 0))(
  ( (ValueCellFull!15584 (v!19149 V!49027)) (EmptyCell!15584) )
))
(declare-datatypes ((array!83008 0))(
  ( (array!83009 (arr!40041 (Array (_ BitVec 32) ValueCell!15584)) (size!40577 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83008)

(declare-fun e!724397 () Bool)

(declare-fun array_inv!30457 (array!83008) Bool)

(assert (=> start!107186 (and (array_inv!30457 _values!1134) e!724397)))

(assert (=> start!107186 true))

(declare-datatypes ((array!83010 0))(
  ( (array!83011 (arr!40042 (Array (_ BitVec 32) (_ BitVec 64))) (size!40578 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83010)

(declare-fun array_inv!30458 (array!83010) Bool)

(assert (=> start!107186 (array_inv!30458 _keys!1364)))

(declare-fun b!1270697 () Bool)

(declare-fun e!724395 () Bool)

(declare-fun tp_is_empty!32875 () Bool)

(assert (=> b!1270697 (= e!724395 tp_is_empty!32875)))

(declare-fun b!1270698 () Bool)

(declare-fun res!845543 () Bool)

(assert (=> b!1270698 (=> (not res!845543) (not e!724398))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270698 (= res!845543 (and (= (size!40577 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40578 _keys!1364) (size!40577 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50893 () Bool)

(declare-fun mapRes!50893 () Bool)

(assert (=> mapIsEmpty!50893 mapRes!50893))

(declare-fun b!1270699 () Bool)

(assert (=> b!1270699 (= e!724398 false)))

(declare-fun lt!574749 () Bool)

(declare-datatypes ((List!28498 0))(
  ( (Nil!28495) (Cons!28494 (h!29703 (_ BitVec 64)) (t!42027 List!28498)) )
))
(declare-fun arrayNoDuplicates!0 (array!83010 (_ BitVec 32) List!28498) Bool)

(assert (=> b!1270699 (= lt!574749 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28495))))

(declare-fun mapNonEmpty!50893 () Bool)

(declare-fun tp!97234 () Bool)

(assert (=> mapNonEmpty!50893 (= mapRes!50893 (and tp!97234 e!724395))))

(declare-fun mapKey!50893 () (_ BitVec 32))

(declare-fun mapValue!50893 () ValueCell!15584)

(declare-fun mapRest!50893 () (Array (_ BitVec 32) ValueCell!15584))

(assert (=> mapNonEmpty!50893 (= (arr!40041 _values!1134) (store mapRest!50893 mapKey!50893 mapValue!50893))))

(declare-fun b!1270700 () Bool)

(declare-fun e!724394 () Bool)

(assert (=> b!1270700 (= e!724394 tp_is_empty!32875)))

(declare-fun b!1270701 () Bool)

(assert (=> b!1270701 (= e!724397 (and e!724394 mapRes!50893))))

(declare-fun condMapEmpty!50893 () Bool)

(declare-fun mapDefault!50893 () ValueCell!15584)

