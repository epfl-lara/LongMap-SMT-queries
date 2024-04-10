; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3970 () Bool)

(assert start!3970)

(declare-fun b_free!875 () Bool)

(declare-fun b_next!875 () Bool)

(assert (=> start!3970 (= b_free!875 (not b_next!875))))

(declare-fun tp!4044 () Bool)

(declare-fun b_and!1685 () Bool)

(assert (=> start!3970 (= tp!4044 b_and!1685)))

(declare-fun b!28523 () Bool)

(declare-fun res!17009 () Bool)

(declare-fun e!18447 () Bool)

(assert (=> b!28523 (=> (not res!17009) (not e!18447))))

(declare-datatypes ((array!1693 0))(
  ( (array!1694 (arr!800 (Array (_ BitVec 32) (_ BitVec 64))) (size!901 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1693)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1693 (_ BitVec 32)) Bool)

(assert (=> b!28523 (= res!17009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28524 () Bool)

(declare-fun e!18446 () Bool)

(assert (=> b!28524 (= e!18446 true)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!67 0))(
  ( (MissingZero!67 (index!2390 (_ BitVec 32))) (Found!67 (index!2391 (_ BitVec 32))) (Intermediate!67 (undefined!879 Bool) (index!2392 (_ BitVec 32)) (x!6321 (_ BitVec 32))) (Undefined!67) (MissingVacant!67 (index!2393 (_ BitVec 32))) )
))
(declare-fun lt!10838 () SeekEntryResult!67)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1693 (_ BitVec 32)) SeekEntryResult!67)

(assert (=> b!28524 (= lt!10838 (seekEntryOrOpen!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!28525 () Bool)

(declare-fun res!17010 () Bool)

(assert (=> b!28525 (=> (not res!17010) (not e!18447))))

(declare-datatypes ((List!665 0))(
  ( (Nil!662) (Cons!661 (h!1228 (_ BitVec 64)) (t!3358 List!665)) )
))
(declare-fun arrayNoDuplicates!0 (array!1693 (_ BitVec 32) List!665) Bool)

(assert (=> b!28525 (= res!17010 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!662))))

(declare-fun mapNonEmpty!1372 () Bool)

(declare-fun mapRes!1372 () Bool)

(declare-fun tp!4045 () Bool)

(declare-fun e!18448 () Bool)

(assert (=> mapNonEmpty!1372 (= mapRes!1372 (and tp!4045 e!18448))))

(declare-datatypes ((V!1463 0))(
  ( (V!1464 (val!641 Int)) )
))
(declare-datatypes ((ValueCell!415 0))(
  ( (ValueCellFull!415 (v!1730 V!1463)) (EmptyCell!415) )
))
(declare-datatypes ((array!1695 0))(
  ( (array!1696 (arr!801 (Array (_ BitVec 32) ValueCell!415)) (size!902 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1695)

(declare-fun mapValue!1372 () ValueCell!415)

(declare-fun mapRest!1372 () (Array (_ BitVec 32) ValueCell!415))

(declare-fun mapKey!1372 () (_ BitVec 32))

(assert (=> mapNonEmpty!1372 (= (arr!801 _values!1501) (store mapRest!1372 mapKey!1372 mapValue!1372))))

(declare-fun b!28526 () Bool)

(declare-fun tp_is_empty!1229 () Bool)

(assert (=> b!28526 (= e!18448 tp_is_empty!1229)))

(declare-fun b!28527 () Bool)

(declare-fun res!17006 () Bool)

(assert (=> b!28527 (=> (not res!17006) (not e!18447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28527 (= res!17006 (validKeyInArray!0 k!1304))))

(declare-fun b!28528 () Bool)

(declare-fun e!18443 () Bool)

(assert (=> b!28528 (= e!18443 (not e!18446))))

(declare-fun res!17003 () Bool)

(assert (=> b!28528 (=> res!17003 e!18446)))

(assert (=> b!28528 (= res!17003 (not (= (size!901 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((tuple2!1066 0))(
  ( (tuple2!1067 (_1!544 (_ BitVec 64)) (_2!544 V!1463)) )
))
(declare-datatypes ((List!666 0))(
  ( (Nil!663) (Cons!662 (h!1229 tuple2!1066) (t!3359 List!666)) )
))
(declare-datatypes ((ListLongMap!643 0))(
  ( (ListLongMap!644 (toList!337 List!666)) )
))
(declare-fun lt!10841 () ListLongMap!643)

(declare-fun lt!10840 () (_ BitVec 32))

(declare-fun contains!277 (ListLongMap!643 (_ BitVec 64)) Bool)

(assert (=> b!28528 (contains!277 lt!10841 (select (arr!800 _keys!1833) lt!10840))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!643 0))(
  ( (Unit!644) )
))
(declare-fun lt!10839 () Unit!643)

(declare-fun zeroValue!1443 () V!1463)

(declare-fun minValue!1443 () V!1463)

(declare-fun lemmaValidKeyInArrayIsInListMap!15 (array!1693 array!1695 (_ BitVec 32) (_ BitVec 32) V!1463 V!1463 (_ BitVec 32) Int) Unit!643)

(assert (=> b!28528 (= lt!10839 (lemmaValidKeyInArrayIsInListMap!15 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10840 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1693 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28528 (= lt!10840 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun res!17008 () Bool)

(assert (=> start!3970 (=> (not res!17008) (not e!18447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3970 (= res!17008 (validMask!0 mask!2294))))

(assert (=> start!3970 e!18447))

(assert (=> start!3970 true))

(assert (=> start!3970 tp!4044))

(declare-fun e!18449 () Bool)

(declare-fun array_inv!549 (array!1695) Bool)

(assert (=> start!3970 (and (array_inv!549 _values!1501) e!18449)))

(declare-fun array_inv!550 (array!1693) Bool)

(assert (=> start!3970 (array_inv!550 _keys!1833)))

(assert (=> start!3970 tp_is_empty!1229))

(declare-fun b!28529 () Bool)

(assert (=> b!28529 (= e!18447 e!18443)))

(declare-fun res!17007 () Bool)

(assert (=> b!28529 (=> (not res!17007) (not e!18443))))

(assert (=> b!28529 (= res!17007 (not (contains!277 lt!10841 k!1304)))))

(declare-fun getCurrentListMap!167 (array!1693 array!1695 (_ BitVec 32) (_ BitVec 32) V!1463 V!1463 (_ BitVec 32) Int) ListLongMap!643)

(assert (=> b!28529 (= lt!10841 (getCurrentListMap!167 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28530 () Bool)

(declare-fun e!18444 () Bool)

(assert (=> b!28530 (= e!18444 tp_is_empty!1229)))

(declare-fun b!28531 () Bool)

(assert (=> b!28531 (= e!18449 (and e!18444 mapRes!1372))))

(declare-fun condMapEmpty!1372 () Bool)

(declare-fun mapDefault!1372 () ValueCell!415)

