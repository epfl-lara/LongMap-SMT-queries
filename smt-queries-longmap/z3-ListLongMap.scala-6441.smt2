; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82488 () Bool)

(assert start!82488)

(declare-fun b!961370 () Bool)

(declare-fun e!542043 () Bool)

(declare-fun e!542045 () Bool)

(declare-fun mapRes!34129 () Bool)

(assert (=> b!961370 (= e!542043 (and e!542045 mapRes!34129))))

(declare-fun condMapEmpty!34129 () Bool)

(declare-datatypes ((V!33547 0))(
  ( (V!33548 (val!10762 Int)) )
))
(declare-datatypes ((ValueCell!10230 0))(
  ( (ValueCellFull!10230 (v!13320 V!33547)) (EmptyCell!10230) )
))
(declare-datatypes ((array!58943 0))(
  ( (array!58944 (arr!28340 (Array (_ BitVec 32) ValueCell!10230)) (size!28819 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58943)

(declare-fun mapDefault!34129 () ValueCell!10230)

(assert (=> b!961370 (= condMapEmpty!34129 (= (arr!28340 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10230)) mapDefault!34129)))))

(declare-fun b!961371 () Bool)

(declare-fun tp_is_empty!21423 () Bool)

(assert (=> b!961371 (= e!542045 tp_is_empty!21423)))

(declare-fun res!643441 () Bool)

(declare-fun e!542044 () Bool)

(assert (=> start!82488 (=> (not res!643441) (not e!542044))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82488 (= res!643441 (validMask!0 mask!2110))))

(assert (=> start!82488 e!542044))

(assert (=> start!82488 true))

(declare-fun array_inv!21959 (array!58943) Bool)

(assert (=> start!82488 (and (array_inv!21959 _values!1400) e!542043)))

(declare-datatypes ((array!58945 0))(
  ( (array!58946 (arr!28341 (Array (_ BitVec 32) (_ BitVec 64))) (size!28820 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58945)

(declare-fun array_inv!21960 (array!58945) Bool)

(assert (=> start!82488 (array_inv!21960 _keys!1686)))

(declare-fun mapIsEmpty!34129 () Bool)

(assert (=> mapIsEmpty!34129 mapRes!34129))

(declare-fun b!961372 () Bool)

(declare-fun e!542042 () Bool)

(assert (=> b!961372 (= e!542042 tp_is_empty!21423)))

(declare-fun b!961373 () Bool)

(declare-fun res!643440 () Bool)

(assert (=> b!961373 (=> (not res!643440) (not e!542044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58945 (_ BitVec 32)) Bool)

(assert (=> b!961373 (= res!643440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961374 () Bool)

(assert (=> b!961374 (= e!542044 false)))

(declare-fun lt!430744 () Bool)

(declare-datatypes ((List!19688 0))(
  ( (Nil!19685) (Cons!19684 (h!20846 (_ BitVec 64)) (t!28051 List!19688)) )
))
(declare-fun arrayNoDuplicates!0 (array!58945 (_ BitVec 32) List!19688) Bool)

(assert (=> b!961374 (= lt!430744 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19685))))

(declare-fun mapNonEmpty!34129 () Bool)

(declare-fun tp!65058 () Bool)

(assert (=> mapNonEmpty!34129 (= mapRes!34129 (and tp!65058 e!542042))))

(declare-fun mapRest!34129 () (Array (_ BitVec 32) ValueCell!10230))

(declare-fun mapValue!34129 () ValueCell!10230)

(declare-fun mapKey!34129 () (_ BitVec 32))

(assert (=> mapNonEmpty!34129 (= (arr!28340 _values!1400) (store mapRest!34129 mapKey!34129 mapValue!34129))))

(declare-fun b!961375 () Bool)

(declare-fun res!643439 () Bool)

(assert (=> b!961375 (=> (not res!643439) (not e!542044))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961375 (= res!643439 (and (= (size!28819 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28820 _keys!1686) (size!28819 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82488 res!643441) b!961375))

(assert (= (and b!961375 res!643439) b!961373))

(assert (= (and b!961373 res!643440) b!961374))

(assert (= (and b!961370 condMapEmpty!34129) mapIsEmpty!34129))

(assert (= (and b!961370 (not condMapEmpty!34129)) mapNonEmpty!34129))

(get-info :version)

(assert (= (and mapNonEmpty!34129 ((_ is ValueCellFull!10230) mapValue!34129)) b!961372))

(assert (= (and b!961370 ((_ is ValueCellFull!10230) mapDefault!34129)) b!961371))

(assert (= start!82488 b!961370))

(declare-fun m!891345 () Bool)

(assert (=> start!82488 m!891345))

(declare-fun m!891347 () Bool)

(assert (=> start!82488 m!891347))

(declare-fun m!891349 () Bool)

(assert (=> start!82488 m!891349))

(declare-fun m!891351 () Bool)

(assert (=> b!961373 m!891351))

(declare-fun m!891353 () Bool)

(assert (=> b!961374 m!891353))

(declare-fun m!891355 () Bool)

(assert (=> mapNonEmpty!34129 m!891355))

(check-sat (not b!961374) (not start!82488) tp_is_empty!21423 (not b!961373) (not mapNonEmpty!34129))
(check-sat)
