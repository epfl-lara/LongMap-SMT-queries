; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82546 () Bool)

(assert start!82546)

(declare-fun b_free!18697 () Bool)

(declare-fun b_next!18697 () Bool)

(assert (=> start!82546 (= b_free!18697 (not b_next!18697))))

(declare-fun tp!65212 () Bool)

(declare-fun b_and!30159 () Bool)

(assert (=> start!82546 (= tp!65212 b_and!30159)))

(declare-fun res!643815 () Bool)

(declare-fun e!542466 () Bool)

(assert (=> start!82546 (=> (not res!643815) (not e!542466))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82546 (= res!643815 (validMask!0 mask!2110))))

(assert (=> start!82546 e!542466))

(assert (=> start!82546 true))

(declare-datatypes ((V!33649 0))(
  ( (V!33650 (val!10800 Int)) )
))
(declare-datatypes ((ValueCell!10268 0))(
  ( (ValueCellFull!10268 (v!13357 V!33649)) (EmptyCell!10268) )
))
(declare-datatypes ((array!59024 0))(
  ( (array!59025 (arr!28381 (Array (_ BitVec 32) ValueCell!10268)) (size!28862 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59024)

(declare-fun e!542463 () Bool)

(declare-fun array_inv!22049 (array!59024) Bool)

(assert (=> start!82546 (and (array_inv!22049 _values!1400) e!542463)))

(declare-datatypes ((array!59026 0))(
  ( (array!59027 (arr!28382 (Array (_ BitVec 32) (_ BitVec 64))) (size!28863 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59026)

(declare-fun array_inv!22050 (array!59026) Bool)

(assert (=> start!82546 (array_inv!22050 _keys!1686)))

(assert (=> start!82546 tp!65212))

(declare-fun tp_is_empty!21499 () Bool)

(assert (=> start!82546 tp_is_empty!21499))

(declare-fun b!961956 () Bool)

(declare-fun res!643812 () Bool)

(assert (=> b!961956 (=> (not res!643812) (not e!542466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59026 (_ BitVec 32)) Bool)

(assert (=> b!961956 (= res!643812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34243 () Bool)

(declare-fun mapRes!34243 () Bool)

(assert (=> mapIsEmpty!34243 mapRes!34243))

(declare-fun b!961957 () Bool)

(declare-fun e!542464 () Bool)

(assert (=> b!961957 (= e!542464 tp_is_empty!21499)))

(declare-fun b!961958 () Bool)

(declare-fun res!643813 () Bool)

(assert (=> b!961958 (=> (not res!643813) (not e!542466))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!961958 (= res!643813 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28863 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28863 _keys!1686))))))

(declare-fun b!961959 () Bool)

(declare-fun res!643816 () Bool)

(assert (=> b!961959 (=> (not res!643816) (not e!542466))))

(declare-datatypes ((List!19736 0))(
  ( (Nil!19733) (Cons!19732 (h!20894 (_ BitVec 64)) (t!28090 List!19736)) )
))
(declare-fun arrayNoDuplicates!0 (array!59026 (_ BitVec 32) List!19736) Bool)

(assert (=> b!961959 (= res!643816 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19733))))

(declare-fun b!961960 () Bool)

(declare-fun e!542465 () Bool)

(assert (=> b!961960 (= e!542465 tp_is_empty!21499)))

(declare-fun b!961961 () Bool)

(declare-fun res!643817 () Bool)

(assert (=> b!961961 (=> (not res!643817) (not e!542466))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961961 (= res!643817 (and (= (size!28862 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28863 _keys!1686) (size!28862 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961962 () Bool)

(declare-fun res!643814 () Bool)

(assert (=> b!961962 (=> (not res!643814) (not e!542466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961962 (= res!643814 (validKeyInArray!0 (select (arr!28382 _keys!1686) i!803)))))

(declare-fun b!961963 () Bool)

(assert (=> b!961963 (= e!542463 (and e!542465 mapRes!34243))))

(declare-fun condMapEmpty!34243 () Bool)

(declare-fun mapDefault!34243 () ValueCell!10268)

(assert (=> b!961963 (= condMapEmpty!34243 (= (arr!28381 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10268)) mapDefault!34243)))))

(declare-fun b!961964 () Bool)

(assert (=> b!961964 (= e!542466 false)))

(declare-fun lt!430613 () Bool)

(declare-fun minValue!1342 () V!33649)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33649)

(declare-datatypes ((tuple2!13928 0))(
  ( (tuple2!13929 (_1!6975 (_ BitVec 64)) (_2!6975 V!33649)) )
))
(declare-datatypes ((List!19737 0))(
  ( (Nil!19734) (Cons!19733 (h!20895 tuple2!13928) (t!28091 List!19737)) )
))
(declare-datatypes ((ListLongMap!12615 0))(
  ( (ListLongMap!12616 (toList!6323 List!19737)) )
))
(declare-fun contains!5370 (ListLongMap!12615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3485 (array!59026 array!59024 (_ BitVec 32) (_ BitVec 32) V!33649 V!33649 (_ BitVec 32) Int) ListLongMap!12615)

(assert (=> b!961964 (= lt!430613 (contains!5370 (getCurrentListMap!3485 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28382 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34243 () Bool)

(declare-fun tp!65211 () Bool)

(assert (=> mapNonEmpty!34243 (= mapRes!34243 (and tp!65211 e!542464))))

(declare-fun mapValue!34243 () ValueCell!10268)

(declare-fun mapRest!34243 () (Array (_ BitVec 32) ValueCell!10268))

(declare-fun mapKey!34243 () (_ BitVec 32))

(assert (=> mapNonEmpty!34243 (= (arr!28381 _values!1400) (store mapRest!34243 mapKey!34243 mapValue!34243))))

(assert (= (and start!82546 res!643815) b!961961))

(assert (= (and b!961961 res!643817) b!961956))

(assert (= (and b!961956 res!643812) b!961959))

(assert (= (and b!961959 res!643816) b!961958))

(assert (= (and b!961958 res!643813) b!961962))

(assert (= (and b!961962 res!643814) b!961964))

(assert (= (and b!961963 condMapEmpty!34243) mapIsEmpty!34243))

(assert (= (and b!961963 (not condMapEmpty!34243)) mapNonEmpty!34243))

(get-info :version)

(assert (= (and mapNonEmpty!34243 ((_ is ValueCellFull!10268) mapValue!34243)) b!961957))

(assert (= (and b!961963 ((_ is ValueCellFull!10268) mapDefault!34243)) b!961960))

(assert (= start!82546 b!961963))

(declare-fun m!891151 () Bool)

(assert (=> mapNonEmpty!34243 m!891151))

(declare-fun m!891153 () Bool)

(assert (=> b!961962 m!891153))

(assert (=> b!961962 m!891153))

(declare-fun m!891155 () Bool)

(assert (=> b!961962 m!891155))

(declare-fun m!891157 () Bool)

(assert (=> start!82546 m!891157))

(declare-fun m!891159 () Bool)

(assert (=> start!82546 m!891159))

(declare-fun m!891161 () Bool)

(assert (=> start!82546 m!891161))

(declare-fun m!891163 () Bool)

(assert (=> b!961964 m!891163))

(assert (=> b!961964 m!891153))

(assert (=> b!961964 m!891163))

(assert (=> b!961964 m!891153))

(declare-fun m!891165 () Bool)

(assert (=> b!961964 m!891165))

(declare-fun m!891167 () Bool)

(assert (=> b!961956 m!891167))

(declare-fun m!891169 () Bool)

(assert (=> b!961959 m!891169))

(check-sat tp_is_empty!21499 (not b!961956) (not b!961962) (not start!82546) (not b_next!18697) (not b!961959) b_and!30159 (not mapNonEmpty!34243) (not b!961964))
(check-sat b_and!30159 (not b_next!18697))
