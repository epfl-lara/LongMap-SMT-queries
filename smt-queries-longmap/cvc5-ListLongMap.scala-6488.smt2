; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82768 () Bool)

(assert start!82768)

(declare-fun b_free!18901 () Bool)

(declare-fun b_next!18901 () Bool)

(assert (=> start!82768 (= b_free!18901 (not b_next!18901))))

(declare-fun tp!65823 () Bool)

(declare-fun b_and!30389 () Bool)

(assert (=> start!82768 (= tp!65823 b_and!30389)))

(declare-fun res!646221 () Bool)

(declare-fun e!544222 () Bool)

(assert (=> start!82768 (=> (not res!646221) (not e!544222))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82768 (= res!646221 (validMask!0 mask!2110))))

(assert (=> start!82768 e!544222))

(assert (=> start!82768 true))

(declare-datatypes ((V!33921 0))(
  ( (V!33922 (val!10902 Int)) )
))
(declare-datatypes ((ValueCell!10370 0))(
  ( (ValueCellFull!10370 (v!13460 V!33921)) (EmptyCell!10370) )
))
(declare-datatypes ((array!59491 0))(
  ( (array!59492 (arr!28614 (Array (_ BitVec 32) ValueCell!10370)) (size!29093 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59491)

(declare-fun e!544224 () Bool)

(declare-fun array_inv!22161 (array!59491) Bool)

(assert (=> start!82768 (and (array_inv!22161 _values!1400) e!544224)))

(declare-datatypes ((array!59493 0))(
  ( (array!59494 (arr!28615 (Array (_ BitVec 32) (_ BitVec 64))) (size!29094 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59493)

(declare-fun array_inv!22162 (array!59493) Bool)

(assert (=> start!82768 (array_inv!22162 _keys!1686)))

(assert (=> start!82768 tp!65823))

(declare-fun tp_is_empty!21703 () Bool)

(assert (=> start!82768 tp_is_empty!21703))

(declare-fun b!965408 () Bool)

(declare-fun e!544226 () Bool)

(assert (=> b!965408 (= e!544226 tp_is_empty!21703)))

(declare-fun mapNonEmpty!34549 () Bool)

(declare-fun mapRes!34549 () Bool)

(declare-fun tp!65822 () Bool)

(assert (=> mapNonEmpty!34549 (= mapRes!34549 (and tp!65822 e!544226))))

(declare-fun mapValue!34549 () ValueCell!10370)

(declare-fun mapKey!34549 () (_ BitVec 32))

(declare-fun mapRest!34549 () (Array (_ BitVec 32) ValueCell!10370))

(assert (=> mapNonEmpty!34549 (= (arr!28614 _values!1400) (store mapRest!34549 mapKey!34549 mapValue!34549))))

(declare-fun b!965409 () Bool)

(declare-fun res!646220 () Bool)

(assert (=> b!965409 (=> (not res!646220) (not e!544222))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965409 (= res!646220 (validKeyInArray!0 (select (arr!28615 _keys!1686) i!803)))))

(declare-fun b!965410 () Bool)

(declare-fun res!646219 () Bool)

(assert (=> b!965410 (=> (not res!646219) (not e!544222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59493 (_ BitVec 32)) Bool)

(assert (=> b!965410 (= res!646219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965411 () Bool)

(declare-fun res!646218 () Bool)

(assert (=> b!965411 (=> (not res!646218) (not e!544222))))

(declare-datatypes ((List!19863 0))(
  ( (Nil!19860) (Cons!19859 (h!21021 (_ BitVec 64)) (t!28226 List!19863)) )
))
(declare-fun arrayNoDuplicates!0 (array!59493 (_ BitVec 32) List!19863) Bool)

(assert (=> b!965411 (= res!646218 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19860))))

(declare-fun b!965412 () Bool)

(declare-fun res!646217 () Bool)

(assert (=> b!965412 (=> (not res!646217) (not e!544222))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965412 (= res!646217 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29094 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29094 _keys!1686))))))

(declare-fun b!965413 () Bool)

(declare-fun res!646222 () Bool)

(assert (=> b!965413 (=> (not res!646222) (not e!544222))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!965413 (= res!646222 (and (= (size!29093 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29094 _keys!1686) (size!29093 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34549 () Bool)

(assert (=> mapIsEmpty!34549 mapRes!34549))

(declare-fun b!965414 () Bool)

(declare-fun e!544225 () Bool)

(assert (=> b!965414 (= e!544225 tp_is_empty!21703)))

(declare-fun b!965415 () Bool)

(assert (=> b!965415 (= e!544222 false)))

(declare-fun lt!431236 () Bool)

(declare-fun minValue!1342 () V!33921)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33921)

(declare-datatypes ((tuple2!14020 0))(
  ( (tuple2!14021 (_1!7021 (_ BitVec 64)) (_2!7021 V!33921)) )
))
(declare-datatypes ((List!19864 0))(
  ( (Nil!19861) (Cons!19860 (h!21022 tuple2!14020) (t!28227 List!19864)) )
))
(declare-datatypes ((ListLongMap!12717 0))(
  ( (ListLongMap!12718 (toList!6374 List!19864)) )
))
(declare-fun contains!5477 (ListLongMap!12717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3607 (array!59493 array!59491 (_ BitVec 32) (_ BitVec 32) V!33921 V!33921 (_ BitVec 32) Int) ListLongMap!12717)

(assert (=> b!965415 (= lt!431236 (contains!5477 (getCurrentListMap!3607 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28615 _keys!1686) i!803)))))

(declare-fun b!965416 () Bool)

(assert (=> b!965416 (= e!544224 (and e!544225 mapRes!34549))))

(declare-fun condMapEmpty!34549 () Bool)

(declare-fun mapDefault!34549 () ValueCell!10370)

