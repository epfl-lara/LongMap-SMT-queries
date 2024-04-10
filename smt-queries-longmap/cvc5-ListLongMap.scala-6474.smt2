; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82684 () Bool)

(assert start!82684)

(declare-fun b_free!18817 () Bool)

(declare-fun b_next!18817 () Bool)

(assert (=> start!82684 (= b_free!18817 (not b_next!18817))))

(declare-fun tp!65571 () Bool)

(declare-fun b_and!30305 () Bool)

(assert (=> start!82684 (= tp!65571 b_and!30305)))

(declare-fun b!964064 () Bool)

(declare-fun e!543522 () Bool)

(declare-fun tp_is_empty!21619 () Bool)

(assert (=> b!964064 (= e!543522 tp_is_empty!21619)))

(declare-fun b!964066 () Bool)

(declare-fun res!645257 () Bool)

(declare-fun e!543525 () Bool)

(assert (=> b!964066 (=> (not res!645257) (not e!543525))))

(declare-datatypes ((array!59327 0))(
  ( (array!59328 (arr!28532 (Array (_ BitVec 32) (_ BitVec 64))) (size!29011 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59327)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59327 (_ BitVec 32)) Bool)

(assert (=> b!964066 (= res!645257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34423 () Bool)

(declare-fun mapRes!34423 () Bool)

(assert (=> mapIsEmpty!34423 mapRes!34423))

(declare-fun b!964067 () Bool)

(declare-fun res!645255 () Bool)

(assert (=> b!964067 (=> (not res!645255) (not e!543525))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964067 (= res!645255 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29011 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29011 _keys!1686))))))

(declare-fun b!964068 () Bool)

(declare-fun e!543524 () Bool)

(assert (=> b!964068 (= e!543524 true)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33809 0))(
  ( (V!33810 (val!10860 Int)) )
))
(declare-datatypes ((ValueCell!10328 0))(
  ( (ValueCellFull!10328 (v!13418 V!33809)) (EmptyCell!10328) )
))
(declare-datatypes ((array!59329 0))(
  ( (array!59330 (arr!28533 (Array (_ BitVec 32) ValueCell!10328)) (size!29012 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59329)

(declare-fun zeroValue!1342 () V!33809)

(declare-fun defaultEntry!1403 () Int)

(declare-fun minValue!1342 () V!33809)

(declare-datatypes ((tuple2!13954 0))(
  ( (tuple2!13955 (_1!6988 (_ BitVec 64)) (_2!6988 V!33809)) )
))
(declare-datatypes ((List!19803 0))(
  ( (Nil!19800) (Cons!19799 (h!20961 tuple2!13954) (t!28166 List!19803)) )
))
(declare-datatypes ((ListLongMap!12651 0))(
  ( (ListLongMap!12652 (toList!6341 List!19803)) )
))
(declare-fun contains!5444 (ListLongMap!12651 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3574 (array!59327 array!59329 (_ BitVec 32) (_ BitVec 32) V!33809 V!33809 (_ BitVec 32) Int) ListLongMap!12651)

(assert (=> b!964068 (contains!5444 (getCurrentListMap!3574 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28532 _keys!1686) i!803))))

(declare-datatypes ((Unit!32265 0))(
  ( (Unit!32266) )
))
(declare-fun lt!431040 () Unit!32265)

(declare-fun lemmaInListMapFromThenInFromSmaller!26 (array!59327 array!59329 (_ BitVec 32) (_ BitVec 32) V!33809 V!33809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32265)

(assert (=> b!964068 (= lt!431040 (lemmaInListMapFromThenInFromSmaller!26 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34423 () Bool)

(declare-fun tp!65570 () Bool)

(assert (=> mapNonEmpty!34423 (= mapRes!34423 (and tp!65570 e!543522))))

(declare-fun mapKey!34423 () (_ BitVec 32))

(declare-fun mapRest!34423 () (Array (_ BitVec 32) ValueCell!10328))

(declare-fun mapValue!34423 () ValueCell!10328)

(assert (=> mapNonEmpty!34423 (= (arr!28533 _values!1400) (store mapRest!34423 mapKey!34423 mapValue!34423))))

(declare-fun b!964069 () Bool)

(declare-fun res!645252 () Bool)

(assert (=> b!964069 (=> (not res!645252) (not e!543525))))

(assert (=> b!964069 (= res!645252 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964070 () Bool)

(assert (=> b!964070 (= e!543525 (not e!543524))))

(declare-fun res!645259 () Bool)

(assert (=> b!964070 (=> res!645259 e!543524)))

(assert (=> b!964070 (= res!645259 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29011 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964070 (contains!5444 (getCurrentListMap!3574 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28532 _keys!1686) i!803))))

(declare-fun lt!431041 () Unit!32265)

(declare-fun lemmaInListMapFromThenInFromMinusOne!27 (array!59327 array!59329 (_ BitVec 32) (_ BitVec 32) V!33809 V!33809 (_ BitVec 32) (_ BitVec 32) Int) Unit!32265)

(assert (=> b!964070 (= lt!431041 (lemmaInListMapFromThenInFromMinusOne!27 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964071 () Bool)

(declare-fun res!645254 () Bool)

(assert (=> b!964071 (=> (not res!645254) (not e!543525))))

(assert (=> b!964071 (= res!645254 (and (= (size!29012 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29011 _keys!1686) (size!29012 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964072 () Bool)

(declare-fun res!645253 () Bool)

(assert (=> b!964072 (=> (not res!645253) (not e!543525))))

(assert (=> b!964072 (= res!645253 (contains!5444 (getCurrentListMap!3574 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28532 _keys!1686) i!803)))))

(declare-fun b!964073 () Bool)

(declare-fun e!543523 () Bool)

(assert (=> b!964073 (= e!543523 tp_is_empty!21619)))

(declare-fun res!645256 () Bool)

(assert (=> start!82684 (=> (not res!645256) (not e!543525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82684 (= res!645256 (validMask!0 mask!2110))))

(assert (=> start!82684 e!543525))

(assert (=> start!82684 true))

(declare-fun e!543526 () Bool)

(declare-fun array_inv!22099 (array!59329) Bool)

(assert (=> start!82684 (and (array_inv!22099 _values!1400) e!543526)))

(declare-fun array_inv!22100 (array!59327) Bool)

(assert (=> start!82684 (array_inv!22100 _keys!1686)))

(assert (=> start!82684 tp!65571))

(assert (=> start!82684 tp_is_empty!21619))

(declare-fun b!964065 () Bool)

(assert (=> b!964065 (= e!543526 (and e!543523 mapRes!34423))))

(declare-fun condMapEmpty!34423 () Bool)

(declare-fun mapDefault!34423 () ValueCell!10328)

