; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82800 () Bool)

(assert start!82800)

(declare-fun b_free!18927 () Bool)

(declare-fun b_next!18927 () Bool)

(assert (=> start!82800 (= b_free!18927 (not b_next!18927))))

(declare-fun tp!65909 () Bool)

(declare-fun b_and!30415 () Bool)

(assert (=> start!82800 (= tp!65909 b_and!30415)))

(declare-fun b!965831 () Bool)

(declare-fun e!544462 () Bool)

(assert (=> b!965831 (= e!544462 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431266 () Bool)

(declare-datatypes ((V!33963 0))(
  ( (V!33964 (val!10918 Int)) )
))
(declare-datatypes ((ValueCell!10386 0))(
  ( (ValueCellFull!10386 (v!13476 V!33963)) (EmptyCell!10386) )
))
(declare-datatypes ((array!59555 0))(
  ( (array!59556 (arr!28646 (Array (_ BitVec 32) ValueCell!10386)) (size!29125 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59555)

(declare-datatypes ((array!59557 0))(
  ( (array!59558 (arr!28647 (Array (_ BitVec 32) (_ BitVec 64))) (size!29126 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59557)

(declare-fun minValue!1342 () V!33963)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33963)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14042 0))(
  ( (tuple2!14043 (_1!7032 (_ BitVec 64)) (_2!7032 V!33963)) )
))
(declare-datatypes ((List!19884 0))(
  ( (Nil!19881) (Cons!19880 (h!21042 tuple2!14042) (t!28247 List!19884)) )
))
(declare-datatypes ((ListLongMap!12739 0))(
  ( (ListLongMap!12740 (toList!6385 List!19884)) )
))
(declare-fun contains!5486 (ListLongMap!12739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3618 (array!59557 array!59555 (_ BitVec 32) (_ BitVec 32) V!33963 V!33963 (_ BitVec 32) Int) ListLongMap!12739)

(assert (=> b!965831 (= lt!431266 (contains!5486 (getCurrentListMap!3618 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28647 _keys!1686) i!803)))))

(declare-fun b!965832 () Bool)

(declare-fun res!646499 () Bool)

(assert (=> b!965832 (=> (not res!646499) (not e!544462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965832 (= res!646499 (validKeyInArray!0 (select (arr!28647 _keys!1686) i!803)))))

(declare-fun res!646500 () Bool)

(assert (=> start!82800 (=> (not res!646500) (not e!544462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82800 (= res!646500 (validMask!0 mask!2110))))

(assert (=> start!82800 e!544462))

(assert (=> start!82800 true))

(declare-fun e!544465 () Bool)

(declare-fun array_inv!22185 (array!59555) Bool)

(assert (=> start!82800 (and (array_inv!22185 _values!1400) e!544465)))

(declare-fun array_inv!22186 (array!59557) Bool)

(assert (=> start!82800 (array_inv!22186 _keys!1686)))

(assert (=> start!82800 tp!65909))

(declare-fun tp_is_empty!21735 () Bool)

(assert (=> start!82800 tp_is_empty!21735))

(declare-fun b!965833 () Bool)

(declare-fun res!646497 () Bool)

(assert (=> b!965833 (=> (not res!646497) (not e!544462))))

(assert (=> b!965833 (= res!646497 (and (= (size!29125 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29126 _keys!1686) (size!29125 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965834 () Bool)

(declare-fun e!544466 () Bool)

(assert (=> b!965834 (= e!544466 tp_is_empty!21735)))

(declare-fun mapIsEmpty!34597 () Bool)

(declare-fun mapRes!34597 () Bool)

(assert (=> mapIsEmpty!34597 mapRes!34597))

(declare-fun b!965835 () Bool)

(assert (=> b!965835 (= e!544465 (and e!544466 mapRes!34597))))

(declare-fun condMapEmpty!34597 () Bool)

(declare-fun mapDefault!34597 () ValueCell!10386)

(assert (=> b!965835 (= condMapEmpty!34597 (= (arr!28646 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10386)) mapDefault!34597)))))

(declare-fun b!965836 () Bool)

(declare-fun res!646501 () Bool)

(assert (=> b!965836 (=> (not res!646501) (not e!544462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59557 (_ BitVec 32)) Bool)

(assert (=> b!965836 (= res!646501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965837 () Bool)

(declare-fun res!646498 () Bool)

(assert (=> b!965837 (=> (not res!646498) (not e!544462))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965837 (= res!646498 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29126 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29126 _keys!1686))))))

(declare-fun b!965838 () Bool)

(declare-fun e!544463 () Bool)

(assert (=> b!965838 (= e!544463 tp_is_empty!21735)))

(declare-fun mapNonEmpty!34597 () Bool)

(declare-fun tp!65910 () Bool)

(assert (=> mapNonEmpty!34597 (= mapRes!34597 (and tp!65910 e!544463))))

(declare-fun mapRest!34597 () (Array (_ BitVec 32) ValueCell!10386))

(declare-fun mapValue!34597 () ValueCell!10386)

(declare-fun mapKey!34597 () (_ BitVec 32))

(assert (=> mapNonEmpty!34597 (= (arr!28646 _values!1400) (store mapRest!34597 mapKey!34597 mapValue!34597))))

(declare-fun b!965839 () Bool)

(declare-fun res!646496 () Bool)

(assert (=> b!965839 (=> (not res!646496) (not e!544462))))

(declare-datatypes ((List!19885 0))(
  ( (Nil!19882) (Cons!19881 (h!21043 (_ BitVec 64)) (t!28248 List!19885)) )
))
(declare-fun arrayNoDuplicates!0 (array!59557 (_ BitVec 32) List!19885) Bool)

(assert (=> b!965839 (= res!646496 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19882))))

(assert (= (and start!82800 res!646500) b!965833))

(assert (= (and b!965833 res!646497) b!965836))

(assert (= (and b!965836 res!646501) b!965839))

(assert (= (and b!965839 res!646496) b!965837))

(assert (= (and b!965837 res!646498) b!965832))

(assert (= (and b!965832 res!646499) b!965831))

(assert (= (and b!965835 condMapEmpty!34597) mapIsEmpty!34597))

(assert (= (and b!965835 (not condMapEmpty!34597)) mapNonEmpty!34597))

(get-info :version)

(assert (= (and mapNonEmpty!34597 ((_ is ValueCellFull!10386) mapValue!34597)) b!965838))

(assert (= (and b!965835 ((_ is ValueCellFull!10386) mapDefault!34597)) b!965834))

(assert (= start!82800 b!965835))

(declare-fun m!894779 () Bool)

(assert (=> start!82800 m!894779))

(declare-fun m!894781 () Bool)

(assert (=> start!82800 m!894781))

(declare-fun m!894783 () Bool)

(assert (=> start!82800 m!894783))

(declare-fun m!894785 () Bool)

(assert (=> b!965832 m!894785))

(assert (=> b!965832 m!894785))

(declare-fun m!894787 () Bool)

(assert (=> b!965832 m!894787))

(declare-fun m!894789 () Bool)

(assert (=> b!965839 m!894789))

(declare-fun m!894791 () Bool)

(assert (=> b!965831 m!894791))

(assert (=> b!965831 m!894785))

(assert (=> b!965831 m!894791))

(assert (=> b!965831 m!894785))

(declare-fun m!894793 () Bool)

(assert (=> b!965831 m!894793))

(declare-fun m!894795 () Bool)

(assert (=> b!965836 m!894795))

(declare-fun m!894797 () Bool)

(assert (=> mapNonEmpty!34597 m!894797))

(check-sat (not b_next!18927) (not b!965831) (not b!965839) (not mapNonEmpty!34597) (not start!82800) (not b!965836) (not b!965832) tp_is_empty!21735 b_and!30415)
(check-sat b_and!30415 (not b_next!18927))
