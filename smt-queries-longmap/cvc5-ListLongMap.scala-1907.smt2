; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33980 () Bool)

(assert start!33980)

(declare-fun b_free!7111 () Bool)

(declare-fun b_next!7111 () Bool)

(assert (=> start!33980 (= b_free!7111 (not b_next!7111))))

(declare-fun tp!24851 () Bool)

(declare-fun b_and!14301 () Bool)

(assert (=> start!33980 (= tp!24851 b_and!14301)))

(declare-fun b!338476 () Bool)

(declare-fun res!186974 () Bool)

(declare-fun e!207684 () Bool)

(assert (=> b!338476 (=> (not res!186974) (not e!207684))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!10395 0))(
  ( (V!10396 (val!3576 Int)) )
))
(declare-datatypes ((ValueCell!3188 0))(
  ( (ValueCellFull!3188 (v!5743 V!10395)) (EmptyCell!3188) )
))
(declare-datatypes ((array!17721 0))(
  ( (array!17722 (arr!8386 (Array (_ BitVec 32) ValueCell!3188)) (size!8738 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17721)

(declare-datatypes ((array!17723 0))(
  ( (array!17724 (arr!8387 (Array (_ BitVec 32) (_ BitVec 64))) (size!8739 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17723)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10395)

(declare-fun zeroValue!1467 () V!10395)

(declare-datatypes ((tuple2!5194 0))(
  ( (tuple2!5195 (_1!2608 (_ BitVec 64)) (_2!2608 V!10395)) )
))
(declare-datatypes ((List!4809 0))(
  ( (Nil!4806) (Cons!4805 (h!5661 tuple2!5194) (t!9907 List!4809)) )
))
(declare-datatypes ((ListLongMap!4107 0))(
  ( (ListLongMap!4108 (toList!2069 List!4809)) )
))
(declare-fun contains!2118 (ListLongMap!4107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1590 (array!17723 array!17721 (_ BitVec 32) (_ BitVec 32) V!10395 V!10395 (_ BitVec 32) Int) ListLongMap!4107)

(assert (=> b!338476 (= res!186974 (not (contains!2118 (getCurrentListMap!1590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!338477 () Bool)

(declare-fun res!186968 () Bool)

(assert (=> b!338477 (=> (not res!186968) (not e!207684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338477 (= res!186968 (validKeyInArray!0 k!1348))))

(declare-fun b!338478 () Bool)

(declare-fun e!207680 () Bool)

(declare-fun tp_is_empty!7063 () Bool)

(assert (=> b!338478 (= e!207680 tp_is_empty!7063)))

(declare-fun b!338479 () Bool)

(declare-fun res!186973 () Bool)

(assert (=> b!338479 (=> (not res!186973) (not e!207684))))

(assert (=> b!338479 (= res!186973 (and (= (size!8738 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8739 _keys!1895) (size!8738 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338480 () Bool)

(declare-fun res!186970 () Bool)

(assert (=> b!338480 (=> (not res!186970) (not e!207684))))

(declare-datatypes ((List!4810 0))(
  ( (Nil!4807) (Cons!4806 (h!5662 (_ BitVec 64)) (t!9908 List!4810)) )
))
(declare-fun arrayNoDuplicates!0 (array!17723 (_ BitVec 32) List!4810) Bool)

(assert (=> b!338480 (= res!186970 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4807))))

(declare-fun b!338482 () Bool)

(declare-fun e!207678 () Bool)

(assert (=> b!338482 (= e!207684 e!207678)))

(declare-fun res!186972 () Bool)

(assert (=> b!338482 (=> (not res!186972) (not e!207678))))

(declare-datatypes ((SeekEntryResult!3238 0))(
  ( (MissingZero!3238 (index!15131 (_ BitVec 32))) (Found!3238 (index!15132 (_ BitVec 32))) (Intermediate!3238 (undefined!4050 Bool) (index!15133 (_ BitVec 32)) (x!33726 (_ BitVec 32))) (Undefined!3238) (MissingVacant!3238 (index!15134 (_ BitVec 32))) )
))
(declare-fun lt!160816 () SeekEntryResult!3238)

(assert (=> b!338482 (= res!186972 (and (not (is-Found!3238 lt!160816)) (is-MissingZero!3238 lt!160816)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17723 (_ BitVec 32)) SeekEntryResult!3238)

(assert (=> b!338482 (= lt!160816 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun lt!160818 () Bool)

(declare-fun b!338483 () Bool)

(assert (=> b!338483 (= e!207678 (and (not lt!160818) (not (= (size!8739 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-datatypes ((Unit!10515 0))(
  ( (Unit!10516) )
))
(declare-fun lt!160817 () Unit!10515)

(declare-fun e!207679 () Unit!10515)

(assert (=> b!338483 (= lt!160817 e!207679)))

(declare-fun c!52428 () Bool)

(assert (=> b!338483 (= c!52428 lt!160818)))

(declare-fun arrayContainsKey!0 (array!17723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338483 (= lt!160818 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!338484 () Bool)

(declare-fun Unit!10517 () Unit!10515)

(assert (=> b!338484 (= e!207679 Unit!10517)))

(declare-fun lt!160819 () Unit!10515)

(declare-fun lemmaArrayContainsKeyThenInListMap!273 (array!17723 array!17721 (_ BitVec 32) (_ BitVec 32) V!10395 V!10395 (_ BitVec 64) (_ BitVec 32) Int) Unit!10515)

(declare-fun arrayScanForKey!0 (array!17723 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338484 (= lt!160819 (lemmaArrayContainsKeyThenInListMap!273 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338484 false))

(declare-fun mapNonEmpty!12006 () Bool)

(declare-fun mapRes!12006 () Bool)

(declare-fun tp!24852 () Bool)

(declare-fun e!207681 () Bool)

(assert (=> mapNonEmpty!12006 (= mapRes!12006 (and tp!24852 e!207681))))

(declare-fun mapKey!12006 () (_ BitVec 32))

(declare-fun mapRest!12006 () (Array (_ BitVec 32) ValueCell!3188))

(declare-fun mapValue!12006 () ValueCell!3188)

(assert (=> mapNonEmpty!12006 (= (arr!8386 _values!1525) (store mapRest!12006 mapKey!12006 mapValue!12006))))

(declare-fun b!338485 () Bool)

(assert (=> b!338485 (= e!207681 tp_is_empty!7063)))

(declare-fun b!338481 () Bool)

(declare-fun res!186971 () Bool)

(assert (=> b!338481 (=> (not res!186971) (not e!207684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17723 (_ BitVec 32)) Bool)

(assert (=> b!338481 (= res!186971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!186969 () Bool)

(assert (=> start!33980 (=> (not res!186969) (not e!207684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33980 (= res!186969 (validMask!0 mask!2385))))

(assert (=> start!33980 e!207684))

(assert (=> start!33980 true))

(assert (=> start!33980 tp_is_empty!7063))

(assert (=> start!33980 tp!24851))

(declare-fun e!207682 () Bool)

(declare-fun array_inv!6220 (array!17721) Bool)

(assert (=> start!33980 (and (array_inv!6220 _values!1525) e!207682)))

(declare-fun array_inv!6221 (array!17723) Bool)

(assert (=> start!33980 (array_inv!6221 _keys!1895)))

(declare-fun b!338486 () Bool)

(assert (=> b!338486 (= e!207682 (and e!207680 mapRes!12006))))

(declare-fun condMapEmpty!12006 () Bool)

(declare-fun mapDefault!12006 () ValueCell!3188)

