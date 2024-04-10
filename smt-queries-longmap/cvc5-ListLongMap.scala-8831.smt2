; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107210 () Bool)

(assert start!107210)

(declare-fun b!1270913 () Bool)

(declare-fun e!724576 () Bool)

(declare-fun tp_is_empty!32899 () Bool)

(assert (=> b!1270913 (= e!724576 tp_is_empty!32899)))

(declare-fun mapIsEmpty!50929 () Bool)

(declare-fun mapRes!50929 () Bool)

(assert (=> mapIsEmpty!50929 mapRes!50929))

(declare-fun mapNonEmpty!50929 () Bool)

(declare-fun tp!97270 () Bool)

(declare-fun e!724575 () Bool)

(assert (=> mapNonEmpty!50929 (= mapRes!50929 (and tp!97270 e!724575))))

(declare-datatypes ((V!49059 0))(
  ( (V!49060 (val!16524 Int)) )
))
(declare-datatypes ((ValueCell!15596 0))(
  ( (ValueCellFull!15596 (v!19161 V!49059)) (EmptyCell!15596) )
))
(declare-datatypes ((array!83054 0))(
  ( (array!83055 (arr!40064 (Array (_ BitVec 32) ValueCell!15596)) (size!40600 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83054)

(declare-fun mapRest!50929 () (Array (_ BitVec 32) ValueCell!15596))

(declare-fun mapKey!50929 () (_ BitVec 32))

(declare-fun mapValue!50929 () ValueCell!15596)

(assert (=> mapNonEmpty!50929 (= (arr!40064 _values!1134) (store mapRest!50929 mapKey!50929 mapValue!50929))))

(declare-fun b!1270914 () Bool)

(declare-fun res!845649 () Bool)

(declare-fun e!724577 () Bool)

(assert (=> b!1270914 (=> (not res!845649) (not e!724577))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83056 0))(
  ( (array!83057 (arr!40065 (Array (_ BitVec 32) (_ BitVec 64))) (size!40601 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83056)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270914 (= res!845649 (and (= (size!40600 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40601 _keys!1364) (size!40600 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270916 () Bool)

(assert (=> b!1270916 (= e!724575 tp_is_empty!32899)))

(declare-fun b!1270917 () Bool)

(declare-fun res!845651 () Bool)

(assert (=> b!1270917 (=> (not res!845651) (not e!724577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83056 (_ BitVec 32)) Bool)

(assert (=> b!1270917 (= res!845651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270918 () Bool)

(declare-fun e!724574 () Bool)

(assert (=> b!1270918 (= e!724574 (and e!724576 mapRes!50929))))

(declare-fun condMapEmpty!50929 () Bool)

(declare-fun mapDefault!50929 () ValueCell!15596)

