; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107148 () Bool)

(assert start!107148)

(declare-fun b!1270355 () Bool)

(declare-fun e!724112 () Bool)

(declare-fun tp_is_empty!32837 () Bool)

(assert (=> b!1270355 (= e!724112 tp_is_empty!32837)))

(declare-fun b!1270356 () Bool)

(declare-fun e!724111 () Bool)

(assert (=> b!1270356 (= e!724111 false)))

(declare-fun lt!574692 () Bool)

(declare-datatypes ((array!82936 0))(
  ( (array!82937 (arr!40005 (Array (_ BitVec 32) (_ BitVec 64))) (size!40541 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82936)

(declare-datatypes ((List!28484 0))(
  ( (Nil!28481) (Cons!28480 (h!29689 (_ BitVec 64)) (t!42013 List!28484)) )
))
(declare-fun arrayNoDuplicates!0 (array!82936 (_ BitVec 32) List!28484) Bool)

(assert (=> b!1270356 (= lt!574692 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28481))))

(declare-fun mapIsEmpty!50836 () Bool)

(declare-fun mapRes!50836 () Bool)

(assert (=> mapIsEmpty!50836 mapRes!50836))

(declare-fun mapNonEmpty!50836 () Bool)

(declare-fun tp!97177 () Bool)

(assert (=> mapNonEmpty!50836 (= mapRes!50836 (and tp!97177 e!724112))))

(declare-datatypes ((V!48975 0))(
  ( (V!48976 (val!16493 Int)) )
))
(declare-datatypes ((ValueCell!15565 0))(
  ( (ValueCellFull!15565 (v!19130 V!48975)) (EmptyCell!15565) )
))
(declare-datatypes ((array!82938 0))(
  ( (array!82939 (arr!40006 (Array (_ BitVec 32) ValueCell!15565)) (size!40542 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82938)

(declare-fun mapKey!50836 () (_ BitVec 32))

(declare-fun mapRest!50836 () (Array (_ BitVec 32) ValueCell!15565))

(declare-fun mapValue!50836 () ValueCell!15565)

(assert (=> mapNonEmpty!50836 (= (arr!40006 _values!1134) (store mapRest!50836 mapKey!50836 mapValue!50836))))

(declare-fun b!1270358 () Bool)

(declare-fun res!845372 () Bool)

(assert (=> b!1270358 (=> (not res!845372) (not e!724111))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82936 (_ BitVec 32)) Bool)

(assert (=> b!1270358 (= res!845372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270359 () Bool)

(declare-fun res!845371 () Bool)

(assert (=> b!1270359 (=> (not res!845371) (not e!724111))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270359 (= res!845371 (and (= (size!40542 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40541 _keys!1364) (size!40542 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270360 () Bool)

(declare-fun e!724110 () Bool)

(declare-fun e!724113 () Bool)

(assert (=> b!1270360 (= e!724110 (and e!724113 mapRes!50836))))

(declare-fun condMapEmpty!50836 () Bool)

(declare-fun mapDefault!50836 () ValueCell!15565)

