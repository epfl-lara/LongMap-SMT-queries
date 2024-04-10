; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82694 () Bool)

(assert start!82694)

(declare-fun b_free!18827 () Bool)

(declare-fun b_next!18827 () Bool)

(assert (=> start!82694 (= b_free!18827 (not b_next!18827))))

(declare-fun tp!65600 () Bool)

(declare-fun b_and!30315 () Bool)

(assert (=> start!82694 (= tp!65600 b_and!30315)))

(declare-fun res!645392 () Bool)

(declare-fun e!543615 () Bool)

(assert (=> start!82694 (=> (not res!645392) (not e!543615))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82694 (= res!645392 (validMask!0 mask!2110))))

(assert (=> start!82694 e!543615))

(assert (=> start!82694 true))

(declare-datatypes ((V!33821 0))(
  ( (V!33822 (val!10865 Int)) )
))
(declare-datatypes ((ValueCell!10333 0))(
  ( (ValueCellFull!10333 (v!13423 V!33821)) (EmptyCell!10333) )
))
(declare-datatypes ((array!59345 0))(
  ( (array!59346 (arr!28541 (Array (_ BitVec 32) ValueCell!10333)) (size!29020 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59345)

(declare-fun e!543617 () Bool)

(declare-fun array_inv!22105 (array!59345) Bool)

(assert (=> start!82694 (and (array_inv!22105 _values!1400) e!543617)))

(declare-datatypes ((array!59347 0))(
  ( (array!59348 (arr!28542 (Array (_ BitVec 32) (_ BitVec 64))) (size!29021 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59347)

(declare-fun array_inv!22106 (array!59347) Bool)

(assert (=> start!82694 (array_inv!22106 _keys!1686)))

(assert (=> start!82694 tp!65600))

(declare-fun tp_is_empty!21629 () Bool)

(assert (=> start!82694 tp_is_empty!21629))

(declare-fun b!964244 () Bool)

(declare-fun res!645389 () Bool)

(assert (=> b!964244 (=> (not res!645389) (not e!543615))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!964244 (= res!645389 (and (= (size!29020 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29021 _keys!1686) (size!29020 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964245 () Bool)

(declare-fun res!645394 () Bool)

(assert (=> b!964245 (=> (not res!645394) (not e!543615))))

(declare-fun minValue!1342 () V!33821)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33821)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13960 0))(
  ( (tuple2!13961 (_1!6991 (_ BitVec 64)) (_2!6991 V!33821)) )
))
(declare-datatypes ((List!19808 0))(
  ( (Nil!19805) (Cons!19804 (h!20966 tuple2!13960) (t!28171 List!19808)) )
))
(declare-datatypes ((ListLongMap!12657 0))(
  ( (ListLongMap!12658 (toList!6344 List!19808)) )
))
(declare-fun contains!5447 (ListLongMap!12657 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3577 (array!59347 array!59345 (_ BitVec 32) (_ BitVec 32) V!33821 V!33821 (_ BitVec 32) Int) ListLongMap!12657)

(assert (=> b!964245 (= res!645394 (contains!5447 (getCurrentListMap!3577 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28542 _keys!1686) i!803)))))

(declare-fun b!964246 () Bool)

(declare-fun res!645393 () Bool)

(assert (=> b!964246 (=> (not res!645393) (not e!543615))))

(declare-datatypes ((List!19809 0))(
  ( (Nil!19806) (Cons!19805 (h!20967 (_ BitVec 64)) (t!28172 List!19809)) )
))
(declare-fun arrayNoDuplicates!0 (array!59347 (_ BitVec 32) List!19809) Bool)

(assert (=> b!964246 (= res!645393 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19806))))

(declare-fun b!964247 () Bool)

(declare-fun res!645391 () Bool)

(assert (=> b!964247 (=> (not res!645391) (not e!543615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59347 (_ BitVec 32)) Bool)

(assert (=> b!964247 (= res!645391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964248 () Bool)

(declare-fun res!645390 () Bool)

(assert (=> b!964248 (=> (not res!645390) (not e!543615))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964248 (= res!645390 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29021 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29021 _keys!1686))))))

(declare-fun mapIsEmpty!34438 () Bool)

(declare-fun mapRes!34438 () Bool)

(assert (=> mapIsEmpty!34438 mapRes!34438))

(declare-fun b!964249 () Bool)

(declare-fun res!645387 () Bool)

(assert (=> b!964249 (=> (not res!645387) (not e!543615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964249 (= res!645387 (validKeyInArray!0 (select (arr!28542 _keys!1686) i!803)))))

(declare-fun b!964250 () Bool)

(declare-fun res!645388 () Bool)

(assert (=> b!964250 (=> (not res!645388) (not e!543615))))

(assert (=> b!964250 (= res!645388 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34438 () Bool)

(declare-fun tp!65601 () Bool)

(declare-fun e!543613 () Bool)

(assert (=> mapNonEmpty!34438 (= mapRes!34438 (and tp!65601 e!543613))))

(declare-fun mapRest!34438 () (Array (_ BitVec 32) ValueCell!10333))

(declare-fun mapKey!34438 () (_ BitVec 32))

(declare-fun mapValue!34438 () ValueCell!10333)

(assert (=> mapNonEmpty!34438 (= (arr!28541 _values!1400) (store mapRest!34438 mapKey!34438 mapValue!34438))))

(declare-fun b!964251 () Bool)

(assert (=> b!964251 (= e!543613 tp_is_empty!21629)))

(declare-fun b!964252 () Bool)

(declare-fun e!543616 () Bool)

(assert (=> b!964252 (= e!543616 true)))

(assert (=> b!964252 (contains!5447 (getCurrentListMap!3577 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28542 _keys!1686) i!803))))

(declare-datatypes ((Unit!32271 0))(
  ( (Unit!32272) )
))
(declare-fun lt!431071 () Unit!32271)

(declare-fun lemmaInListMapFromThenInFromSmaller!29 (array!59347 array!59345 (_ BitVec 32) (_ BitVec 32) V!33821 V!33821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32271)

(assert (=> b!964252 (= lt!431071 (lemmaInListMapFromThenInFromSmaller!29 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964253 () Bool)

(assert (=> b!964253 (= e!543615 (not e!543616))))

(declare-fun res!645386 () Bool)

(assert (=> b!964253 (=> res!645386 e!543616)))

(assert (=> b!964253 (= res!645386 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29021 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964253 (contains!5447 (getCurrentListMap!3577 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28542 _keys!1686) i!803))))

(declare-fun lt!431070 () Unit!32271)

(declare-fun lemmaInListMapFromThenInFromMinusOne!30 (array!59347 array!59345 (_ BitVec 32) (_ BitVec 32) V!33821 V!33821 (_ BitVec 32) (_ BitVec 32) Int) Unit!32271)

(assert (=> b!964253 (= lt!431070 (lemmaInListMapFromThenInFromMinusOne!30 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964254 () Bool)

(declare-fun e!543612 () Bool)

(assert (=> b!964254 (= e!543612 tp_is_empty!21629)))

(declare-fun b!964255 () Bool)

(assert (=> b!964255 (= e!543617 (and e!543612 mapRes!34438))))

(declare-fun condMapEmpty!34438 () Bool)

(declare-fun mapDefault!34438 () ValueCell!10333)

