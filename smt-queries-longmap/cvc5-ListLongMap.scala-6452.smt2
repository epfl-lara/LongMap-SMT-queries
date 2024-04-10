; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82552 () Bool)

(assert start!82552)

(declare-fun b_free!18685 () Bool)

(declare-fun b_next!18685 () Bool)

(assert (=> start!82552 (= b_free!18685 (not b_next!18685))))

(declare-fun tp!65174 () Bool)

(declare-fun b_and!30173 () Bool)

(assert (=> start!82552 (= tp!65174 b_and!30173)))

(declare-fun b!962033 () Bool)

(declare-fun e!542525 () Bool)

(assert (=> b!962033 (= e!542525 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33633 0))(
  ( (V!33634 (val!10794 Int)) )
))
(declare-datatypes ((ValueCell!10262 0))(
  ( (ValueCellFull!10262 (v!13352 V!33633)) (EmptyCell!10262) )
))
(declare-datatypes ((array!59071 0))(
  ( (array!59072 (arr!28404 (Array (_ BitVec 32) ValueCell!10262)) (size!28883 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59071)

(declare-datatypes ((array!59073 0))(
  ( (array!59074 (arr!28405 (Array (_ BitVec 32) (_ BitVec 64))) (size!28884 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59073)

(declare-fun minValue!1342 () V!33633)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun lt!430831 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33633)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13864 0))(
  ( (tuple2!13865 (_1!6943 (_ BitVec 64)) (_2!6943 V!33633)) )
))
(declare-datatypes ((List!19712 0))(
  ( (Nil!19709) (Cons!19708 (h!20870 tuple2!13864) (t!28075 List!19712)) )
))
(declare-datatypes ((ListLongMap!12561 0))(
  ( (ListLongMap!12562 (toList!6296 List!19712)) )
))
(declare-fun contains!5399 (ListLongMap!12561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3529 (array!59073 array!59071 (_ BitVec 32) (_ BitVec 32) V!33633 V!33633 (_ BitVec 32) Int) ListLongMap!12561)

(assert (=> b!962033 (= lt!430831 (contains!5399 (getCurrentListMap!3529 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28405 _keys!1686) i!803)))))

(declare-fun res!643815 () Bool)

(assert (=> start!82552 (=> (not res!643815) (not e!542525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82552 (= res!643815 (validMask!0 mask!2110))))

(assert (=> start!82552 e!542525))

(assert (=> start!82552 true))

(declare-fun e!542521 () Bool)

(declare-fun array_inv!22013 (array!59071) Bool)

(assert (=> start!82552 (and (array_inv!22013 _values!1400) e!542521)))

(declare-fun array_inv!22014 (array!59073) Bool)

(assert (=> start!82552 (array_inv!22014 _keys!1686)))

(assert (=> start!82552 tp!65174))

(declare-fun tp_is_empty!21487 () Bool)

(assert (=> start!82552 tp_is_empty!21487))

(declare-fun b!962034 () Bool)

(declare-fun e!542523 () Bool)

(assert (=> b!962034 (= e!542523 tp_is_empty!21487)))

(declare-fun b!962035 () Bool)

(declare-fun res!643819 () Bool)

(assert (=> b!962035 (=> (not res!643819) (not e!542525))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962035 (= res!643819 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28884 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28884 _keys!1686))))))

(declare-fun mapIsEmpty!34225 () Bool)

(declare-fun mapRes!34225 () Bool)

(assert (=> mapIsEmpty!34225 mapRes!34225))

(declare-fun b!962036 () Bool)

(declare-fun e!542522 () Bool)

(assert (=> b!962036 (= e!542522 tp_is_empty!21487)))

(declare-fun mapNonEmpty!34225 () Bool)

(declare-fun tp!65175 () Bool)

(assert (=> mapNonEmpty!34225 (= mapRes!34225 (and tp!65175 e!542523))))

(declare-fun mapKey!34225 () (_ BitVec 32))

(declare-fun mapValue!34225 () ValueCell!10262)

(declare-fun mapRest!34225 () (Array (_ BitVec 32) ValueCell!10262))

(assert (=> mapNonEmpty!34225 (= (arr!28404 _values!1400) (store mapRest!34225 mapKey!34225 mapValue!34225))))

(declare-fun b!962037 () Bool)

(declare-fun res!643816 () Bool)

(assert (=> b!962037 (=> (not res!643816) (not e!542525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59073 (_ BitVec 32)) Bool)

(assert (=> b!962037 (= res!643816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962038 () Bool)

(declare-fun res!643817 () Bool)

(assert (=> b!962038 (=> (not res!643817) (not e!542525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962038 (= res!643817 (validKeyInArray!0 (select (arr!28405 _keys!1686) i!803)))))

(declare-fun b!962039 () Bool)

(declare-fun res!643814 () Bool)

(assert (=> b!962039 (=> (not res!643814) (not e!542525))))

(assert (=> b!962039 (= res!643814 (and (= (size!28883 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28884 _keys!1686) (size!28883 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962040 () Bool)

(declare-fun res!643818 () Bool)

(assert (=> b!962040 (=> (not res!643818) (not e!542525))))

(declare-datatypes ((List!19713 0))(
  ( (Nil!19710) (Cons!19709 (h!20871 (_ BitVec 64)) (t!28076 List!19713)) )
))
(declare-fun arrayNoDuplicates!0 (array!59073 (_ BitVec 32) List!19713) Bool)

(assert (=> b!962040 (= res!643818 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19710))))

(declare-fun b!962041 () Bool)

(assert (=> b!962041 (= e!542521 (and e!542522 mapRes!34225))))

(declare-fun condMapEmpty!34225 () Bool)

(declare-fun mapDefault!34225 () ValueCell!10262)

