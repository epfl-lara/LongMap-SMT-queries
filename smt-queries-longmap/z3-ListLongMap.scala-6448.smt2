; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82530 () Bool)

(assert start!82530)

(declare-fun b!961748 () Bool)

(declare-fun e!542359 () Bool)

(declare-fun tp_is_empty!21465 () Bool)

(assert (=> b!961748 (= e!542359 tp_is_empty!21465)))

(declare-fun b!961749 () Bool)

(declare-fun e!542356 () Bool)

(assert (=> b!961749 (= e!542356 false)))

(declare-fun lt!430807 () Bool)

(declare-datatypes ((array!59027 0))(
  ( (array!59028 (arr!28382 (Array (_ BitVec 32) (_ BitVec 64))) (size!28861 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59027)

(declare-datatypes ((List!19701 0))(
  ( (Nil!19698) (Cons!19697 (h!20859 (_ BitVec 64)) (t!28064 List!19701)) )
))
(declare-fun arrayNoDuplicates!0 (array!59027 (_ BitVec 32) List!19701) Bool)

(assert (=> b!961749 (= lt!430807 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19698))))

(declare-fun mapIsEmpty!34192 () Bool)

(declare-fun mapRes!34192 () Bool)

(assert (=> mapIsEmpty!34192 mapRes!34192))

(declare-fun mapNonEmpty!34192 () Bool)

(declare-fun tp!65121 () Bool)

(declare-fun e!542357 () Bool)

(assert (=> mapNonEmpty!34192 (= mapRes!34192 (and tp!65121 e!542357))))

(declare-datatypes ((V!33603 0))(
  ( (V!33604 (val!10783 Int)) )
))
(declare-datatypes ((ValueCell!10251 0))(
  ( (ValueCellFull!10251 (v!13341 V!33603)) (EmptyCell!10251) )
))
(declare-fun mapValue!34192 () ValueCell!10251)

(declare-datatypes ((array!59029 0))(
  ( (array!59030 (arr!28383 (Array (_ BitVec 32) ValueCell!10251)) (size!28862 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59029)

(declare-fun mapRest!34192 () (Array (_ BitVec 32) ValueCell!10251))

(declare-fun mapKey!34192 () (_ BitVec 32))

(assert (=> mapNonEmpty!34192 (= (arr!28383 _values!1400) (store mapRest!34192 mapKey!34192 mapValue!34192))))

(declare-fun b!961750 () Bool)

(declare-fun e!542358 () Bool)

(assert (=> b!961750 (= e!542358 (and e!542359 mapRes!34192))))

(declare-fun condMapEmpty!34192 () Bool)

(declare-fun mapDefault!34192 () ValueCell!10251)

(assert (=> b!961750 (= condMapEmpty!34192 (= (arr!28383 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10251)) mapDefault!34192)))))

(declare-fun b!961752 () Bool)

(assert (=> b!961752 (= e!542357 tp_is_empty!21465)))

(declare-fun b!961753 () Bool)

(declare-fun res!643629 () Bool)

(assert (=> b!961753 (=> (not res!643629) (not e!542356))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59027 (_ BitVec 32)) Bool)

(assert (=> b!961753 (= res!643629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!643628 () Bool)

(assert (=> start!82530 (=> (not res!643628) (not e!542356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82530 (= res!643628 (validMask!0 mask!2110))))

(assert (=> start!82530 e!542356))

(assert (=> start!82530 true))

(declare-fun array_inv!21995 (array!59029) Bool)

(assert (=> start!82530 (and (array_inv!21995 _values!1400) e!542358)))

(declare-fun array_inv!21996 (array!59027) Bool)

(assert (=> start!82530 (array_inv!21996 _keys!1686)))

(declare-fun b!961751 () Bool)

(declare-fun res!643630 () Bool)

(assert (=> b!961751 (=> (not res!643630) (not e!542356))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961751 (= res!643630 (and (= (size!28862 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28861 _keys!1686) (size!28862 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82530 res!643628) b!961751))

(assert (= (and b!961751 res!643630) b!961753))

(assert (= (and b!961753 res!643629) b!961749))

(assert (= (and b!961750 condMapEmpty!34192) mapIsEmpty!34192))

(assert (= (and b!961750 (not condMapEmpty!34192)) mapNonEmpty!34192))

(get-info :version)

(assert (= (and mapNonEmpty!34192 ((_ is ValueCellFull!10251) mapValue!34192)) b!961752))

(assert (= (and b!961750 ((_ is ValueCellFull!10251) mapDefault!34192)) b!961748))

(assert (= start!82530 b!961750))

(declare-fun m!891597 () Bool)

(assert (=> b!961749 m!891597))

(declare-fun m!891599 () Bool)

(assert (=> mapNonEmpty!34192 m!891599))

(declare-fun m!891601 () Bool)

(assert (=> b!961753 m!891601))

(declare-fun m!891603 () Bool)

(assert (=> start!82530 m!891603))

(declare-fun m!891605 () Bool)

(assert (=> start!82530 m!891605))

(declare-fun m!891607 () Bool)

(assert (=> start!82530 m!891607))

(check-sat tp_is_empty!21465 (not mapNonEmpty!34192) (not b!961753) (not start!82530) (not b!961749))
(check-sat)
