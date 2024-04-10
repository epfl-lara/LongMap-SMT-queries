; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82700 () Bool)

(assert start!82700)

(declare-fun b_free!18833 () Bool)

(declare-fun b_next!18833 () Bool)

(assert (=> start!82700 (= b_free!18833 (not b_next!18833))))

(declare-fun tp!65619 () Bool)

(declare-fun b_and!30321 () Bool)

(assert (=> start!82700 (= tp!65619 b_and!30321)))

(declare-fun b!964352 () Bool)

(declare-fun res!645472 () Bool)

(declare-fun e!543669 () Bool)

(assert (=> b!964352 (=> (not res!645472) (not e!543669))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964352 (= res!645472 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964353 () Bool)

(declare-fun res!645468 () Bool)

(assert (=> b!964353 (=> (not res!645468) (not e!543669))))

(declare-datatypes ((array!59357 0))(
  ( (array!59358 (arr!28547 (Array (_ BitVec 32) (_ BitVec 64))) (size!29026 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59357)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964353 (= res!645468 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29026 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29026 _keys!1686))))))

(declare-fun mapIsEmpty!34447 () Bool)

(declare-fun mapRes!34447 () Bool)

(assert (=> mapIsEmpty!34447 mapRes!34447))

(declare-fun b!964354 () Bool)

(declare-fun e!543667 () Bool)

(assert (=> b!964354 (= e!543669 (not e!543667))))

(declare-fun res!645470 () Bool)

(assert (=> b!964354 (=> res!645470 e!543667)))

(assert (=> b!964354 (= res!645470 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29026 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33829 0))(
  ( (V!33830 (val!10868 Int)) )
))
(declare-datatypes ((ValueCell!10336 0))(
  ( (ValueCellFull!10336 (v!13426 V!33829)) (EmptyCell!10336) )
))
(declare-datatypes ((array!59359 0))(
  ( (array!59360 (arr!28548 (Array (_ BitVec 32) ValueCell!10336)) (size!29027 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59359)

(declare-fun minValue!1342 () V!33829)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33829)

(declare-datatypes ((tuple2!13966 0))(
  ( (tuple2!13967 (_1!6994 (_ BitVec 64)) (_2!6994 V!33829)) )
))
(declare-datatypes ((List!19813 0))(
  ( (Nil!19810) (Cons!19809 (h!20971 tuple2!13966) (t!28176 List!19813)) )
))
(declare-datatypes ((ListLongMap!12663 0))(
  ( (ListLongMap!12664 (toList!6347 List!19813)) )
))
(declare-fun contains!5450 (ListLongMap!12663 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3580 (array!59357 array!59359 (_ BitVec 32) (_ BitVec 32) V!33829 V!33829 (_ BitVec 32) Int) ListLongMap!12663)

(assert (=> b!964354 (contains!5450 (getCurrentListMap!3580 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28547 _keys!1686) i!803))))

(declare-datatypes ((Unit!32277 0))(
  ( (Unit!32278) )
))
(declare-fun lt!431089 () Unit!32277)

(declare-fun lemmaInListMapFromThenInFromMinusOne!33 (array!59357 array!59359 (_ BitVec 32) (_ BitVec 32) V!33829 V!33829 (_ BitVec 32) (_ BitVec 32) Int) Unit!32277)

(assert (=> b!964354 (= lt!431089 (lemmaInListMapFromThenInFromMinusOne!33 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964355 () Bool)

(declare-fun e!543671 () Bool)

(declare-fun tp_is_empty!21635 () Bool)

(assert (=> b!964355 (= e!543671 tp_is_empty!21635)))

(declare-fun b!964356 () Bool)

(declare-fun res!645467 () Bool)

(assert (=> b!964356 (=> (not res!645467) (not e!543669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59357 (_ BitVec 32)) Bool)

(assert (=> b!964356 (= res!645467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964357 () Bool)

(declare-fun res!645471 () Bool)

(assert (=> b!964357 (=> (not res!645471) (not e!543669))))

(assert (=> b!964357 (= res!645471 (and (= (size!29027 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29026 _keys!1686) (size!29027 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964358 () Bool)

(declare-fun e!543668 () Bool)

(assert (=> b!964358 (= e!543668 (and e!543671 mapRes!34447))))

(declare-fun condMapEmpty!34447 () Bool)

(declare-fun mapDefault!34447 () ValueCell!10336)

