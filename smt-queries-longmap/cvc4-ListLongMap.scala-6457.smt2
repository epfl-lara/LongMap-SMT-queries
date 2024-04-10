; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82586 () Bool)

(assert start!82586)

(declare-fun b_free!18719 () Bool)

(declare-fun b_next!18719 () Bool)

(assert (=> start!82586 (= b_free!18719 (not b_next!18719))))

(declare-fun tp!65277 () Bool)

(declare-fun b_and!30207 () Bool)

(assert (=> start!82586 (= tp!65277 b_and!30207)))

(declare-fun b!962492 () Bool)

(declare-fun res!644121 () Bool)

(declare-fun e!542778 () Bool)

(assert (=> b!962492 (=> (not res!644121) (not e!542778))))

(declare-datatypes ((array!59139 0))(
  ( (array!59140 (arr!28438 (Array (_ BitVec 32) (_ BitVec 64))) (size!28917 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59139)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962492 (= res!644121 (validKeyInArray!0 (select (arr!28438 _keys!1686) i!803)))))

(declare-fun b!962493 () Bool)

(declare-fun res!644120 () Bool)

(assert (=> b!962493 (=> (not res!644120) (not e!542778))))

(declare-datatypes ((List!19735 0))(
  ( (Nil!19732) (Cons!19731 (h!20893 (_ BitVec 64)) (t!28098 List!19735)) )
))
(declare-fun arrayNoDuplicates!0 (array!59139 (_ BitVec 32) List!19735) Bool)

(assert (=> b!962493 (= res!644120 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19732))))

(declare-fun b!962494 () Bool)

(declare-fun res!644123 () Bool)

(assert (=> b!962494 (=> (not res!644123) (not e!542778))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59139 (_ BitVec 32)) Bool)

(assert (=> b!962494 (= res!644123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962495 () Bool)

(assert (=> b!962495 (= e!542778 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33677 0))(
  ( (V!33678 (val!10811 Int)) )
))
(declare-datatypes ((ValueCell!10279 0))(
  ( (ValueCellFull!10279 (v!13369 V!33677)) (EmptyCell!10279) )
))
(declare-datatypes ((array!59141 0))(
  ( (array!59142 (arr!28439 (Array (_ BitVec 32) ValueCell!10279)) (size!28918 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59141)

(declare-fun minValue!1342 () V!33677)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430882 () Bool)

(declare-fun zeroValue!1342 () V!33677)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13884 0))(
  ( (tuple2!13885 (_1!6953 (_ BitVec 64)) (_2!6953 V!33677)) )
))
(declare-datatypes ((List!19736 0))(
  ( (Nil!19733) (Cons!19732 (h!20894 tuple2!13884) (t!28099 List!19736)) )
))
(declare-datatypes ((ListLongMap!12581 0))(
  ( (ListLongMap!12582 (toList!6306 List!19736)) )
))
(declare-fun contains!5409 (ListLongMap!12581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3539 (array!59139 array!59141 (_ BitVec 32) (_ BitVec 32) V!33677 V!33677 (_ BitVec 32) Int) ListLongMap!12581)

(assert (=> b!962495 (= lt!430882 (contains!5409 (getCurrentListMap!3539 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28438 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34276 () Bool)

(declare-fun mapRes!34276 () Bool)

(assert (=> mapIsEmpty!34276 mapRes!34276))

(declare-fun b!962496 () Bool)

(declare-fun e!542777 () Bool)

(declare-fun tp_is_empty!21521 () Bool)

(assert (=> b!962496 (= e!542777 tp_is_empty!21521)))

(declare-fun b!962497 () Bool)

(declare-fun res!644122 () Bool)

(assert (=> b!962497 (=> (not res!644122) (not e!542778))))

(assert (=> b!962497 (= res!644122 (and (= (size!28918 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28917 _keys!1686) (size!28918 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962498 () Bool)

(declare-fun e!542779 () Bool)

(assert (=> b!962498 (= e!542779 tp_is_empty!21521)))

(declare-fun res!644124 () Bool)

(assert (=> start!82586 (=> (not res!644124) (not e!542778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82586 (= res!644124 (validMask!0 mask!2110))))

(assert (=> start!82586 e!542778))

(assert (=> start!82586 true))

(declare-fun e!542776 () Bool)

(declare-fun array_inv!22035 (array!59141) Bool)

(assert (=> start!82586 (and (array_inv!22035 _values!1400) e!542776)))

(declare-fun array_inv!22036 (array!59139) Bool)

(assert (=> start!82586 (array_inv!22036 _keys!1686)))

(assert (=> start!82586 tp!65277))

(assert (=> start!82586 tp_is_empty!21521))

(declare-fun mapNonEmpty!34276 () Bool)

(declare-fun tp!65276 () Bool)

(assert (=> mapNonEmpty!34276 (= mapRes!34276 (and tp!65276 e!542779))))

(declare-fun mapKey!34276 () (_ BitVec 32))

(declare-fun mapValue!34276 () ValueCell!10279)

(declare-fun mapRest!34276 () (Array (_ BitVec 32) ValueCell!10279))

(assert (=> mapNonEmpty!34276 (= (arr!28439 _values!1400) (store mapRest!34276 mapKey!34276 mapValue!34276))))

(declare-fun b!962499 () Bool)

(declare-fun res!644125 () Bool)

(assert (=> b!962499 (=> (not res!644125) (not e!542778))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962499 (= res!644125 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28917 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28917 _keys!1686))))))

(declare-fun b!962500 () Bool)

(assert (=> b!962500 (= e!542776 (and e!542777 mapRes!34276))))

(declare-fun condMapEmpty!34276 () Bool)

(declare-fun mapDefault!34276 () ValueCell!10279)

