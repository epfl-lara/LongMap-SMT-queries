; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107318 () Bool)

(assert start!107318)

(declare-fun b!1271887 () Bool)

(declare-fun res!846137 () Bool)

(declare-fun e!725385 () Bool)

(assert (=> b!1271887 (=> (not res!846137) (not e!725385))))

(declare-datatypes ((array!83262 0))(
  ( (array!83263 (arr!40168 (Array (_ BitVec 32) (_ BitVec 64))) (size!40704 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83262)

(declare-datatypes ((List!28543 0))(
  ( (Nil!28540) (Cons!28539 (h!29748 (_ BitVec 64)) (t!42072 List!28543)) )
))
(declare-fun arrayNoDuplicates!0 (array!83262 (_ BitVec 32) List!28543) Bool)

(assert (=> b!1271887 (= res!846137 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28540))))

(declare-fun b!1271888 () Bool)

(declare-fun e!725386 () Bool)

(declare-fun tp_is_empty!33007 () Bool)

(assert (=> b!1271888 (= e!725386 tp_is_empty!33007)))

(declare-fun b!1271889 () Bool)

(declare-fun res!846139 () Bool)

(assert (=> b!1271889 (=> (not res!846139) (not e!725385))))

(declare-datatypes ((V!49203 0))(
  ( (V!49204 (val!16578 Int)) )
))
(declare-datatypes ((ValueCell!15650 0))(
  ( (ValueCellFull!15650 (v!19215 V!49203)) (EmptyCell!15650) )
))
(declare-datatypes ((array!83264 0))(
  ( (array!83265 (arr!40169 (Array (_ BitVec 32) ValueCell!15650)) (size!40705 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83264)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271889 (= res!846139 (and (= (size!40705 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40704 _keys!1364) (size!40705 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271890 () Bool)

(declare-fun e!725388 () Bool)

(declare-fun e!725387 () Bool)

(declare-fun mapRes!51091 () Bool)

(assert (=> b!1271890 (= e!725388 (and e!725387 mapRes!51091))))

(declare-fun condMapEmpty!51091 () Bool)

(declare-fun mapDefault!51091 () ValueCell!15650)

