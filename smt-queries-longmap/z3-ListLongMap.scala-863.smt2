; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20276 () Bool)

(assert start!20276)

(declare-fun b_free!4935 () Bool)

(declare-fun b_next!4935 () Bool)

(assert (=> start!20276 (= b_free!4935 (not b_next!4935))))

(declare-fun tp!17836 () Bool)

(declare-fun b_and!11681 () Bool)

(assert (=> start!20276 (= tp!17836 b_and!11681)))

(declare-fun b!199574 () Bool)

(declare-fun e!130991 () Bool)

(assert (=> b!199574 (= e!130991 (not true))))

(declare-datatypes ((V!6035 0))(
  ( (V!6036 (val!2440 Int)) )
))
(declare-datatypes ((tuple2!3690 0))(
  ( (tuple2!3691 (_1!1856 (_ BitVec 64)) (_2!1856 V!6035)) )
))
(declare-datatypes ((List!2607 0))(
  ( (Nil!2604) (Cons!2603 (h!3245 tuple2!3690) (t!7538 List!2607)) )
))
(declare-datatypes ((ListLongMap!2603 0))(
  ( (ListLongMap!2604 (toList!1317 List!2607)) )
))
(declare-fun lt!98403 () ListLongMap!2603)

(declare-datatypes ((ValueCell!2052 0))(
  ( (ValueCellFull!2052 (v!4410 V!6035)) (EmptyCell!2052) )
))
(declare-datatypes ((array!8821 0))(
  ( (array!8822 (arr!4161 (Array (_ BitVec 32) ValueCell!2052)) (size!4486 (_ BitVec 32))) )
))
(declare-fun lt!98398 () array!8821)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6035)

(declare-datatypes ((array!8823 0))(
  ( (array!8824 (arr!4162 (Array (_ BitVec 32) (_ BitVec 64))) (size!4487 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8823)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6035)

(declare-fun getCurrentListMap!908 (array!8823 array!8821 (_ BitVec 32) (_ BitVec 32) V!6035 V!6035 (_ BitVec 32) Int) ListLongMap!2603)

(assert (=> b!199574 (= lt!98403 (getCurrentListMap!908 _keys!825 lt!98398 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98400 () ListLongMap!2603)

(declare-fun lt!98401 () ListLongMap!2603)

(assert (=> b!199574 (and (= lt!98400 lt!98401) (= lt!98401 lt!98400))))

(declare-fun v!520 () V!6035)

(declare-fun lt!98399 () ListLongMap!2603)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!344 (ListLongMap!2603 tuple2!3690) ListLongMap!2603)

(assert (=> b!199574 (= lt!98401 (+!344 lt!98399 (tuple2!3691 k0!843 v!520)))))

(declare-fun _values!649 () array!8821)

(declare-datatypes ((Unit!5990 0))(
  ( (Unit!5991) )
))
(declare-fun lt!98402 () Unit!5990)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!21 (array!8823 array!8821 (_ BitVec 32) (_ BitVec 32) V!6035 V!6035 (_ BitVec 32) (_ BitVec 64) V!6035 (_ BitVec 32) Int) Unit!5990)

(assert (=> b!199574 (= lt!98402 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!21 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!282 (array!8823 array!8821 (_ BitVec 32) (_ BitVec 32) V!6035 V!6035 (_ BitVec 32) Int) ListLongMap!2603)

(assert (=> b!199574 (= lt!98400 (getCurrentListMapNoExtraKeys!282 _keys!825 lt!98398 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199574 (= lt!98398 (array!8822 (store (arr!4161 _values!649) i!601 (ValueCellFull!2052 v!520)) (size!4486 _values!649)))))

(assert (=> b!199574 (= lt!98399 (getCurrentListMapNoExtraKeys!282 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199575 () Bool)

(declare-fun e!130992 () Bool)

(declare-fun tp_is_empty!4791 () Bool)

(assert (=> b!199575 (= e!130992 tp_is_empty!4791)))

(declare-fun b!199576 () Bool)

(declare-fun e!130993 () Bool)

(declare-fun e!130994 () Bool)

(declare-fun mapRes!8255 () Bool)

(assert (=> b!199576 (= e!130993 (and e!130994 mapRes!8255))))

(declare-fun condMapEmpty!8255 () Bool)

(declare-fun mapDefault!8255 () ValueCell!2052)

(assert (=> b!199576 (= condMapEmpty!8255 (= (arr!4161 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2052)) mapDefault!8255)))))

(declare-fun mapNonEmpty!8255 () Bool)

(declare-fun tp!17837 () Bool)

(assert (=> mapNonEmpty!8255 (= mapRes!8255 (and tp!17837 e!130992))))

(declare-fun mapRest!8255 () (Array (_ BitVec 32) ValueCell!2052))

(declare-fun mapKey!8255 () (_ BitVec 32))

(declare-fun mapValue!8255 () ValueCell!2052)

(assert (=> mapNonEmpty!8255 (= (arr!4161 _values!649) (store mapRest!8255 mapKey!8255 mapValue!8255))))

(declare-fun b!199577 () Bool)

(declare-fun res!94888 () Bool)

(assert (=> b!199577 (=> (not res!94888) (not e!130991))))

(assert (=> b!199577 (= res!94888 (= (select (arr!4162 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8255 () Bool)

(assert (=> mapIsEmpty!8255 mapRes!8255))

(declare-fun res!94883 () Bool)

(assert (=> start!20276 (=> (not res!94883) (not e!130991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20276 (= res!94883 (validMask!0 mask!1149))))

(assert (=> start!20276 e!130991))

(declare-fun array_inv!2733 (array!8821) Bool)

(assert (=> start!20276 (and (array_inv!2733 _values!649) e!130993)))

(assert (=> start!20276 true))

(assert (=> start!20276 tp_is_empty!4791))

(declare-fun array_inv!2734 (array!8823) Bool)

(assert (=> start!20276 (array_inv!2734 _keys!825)))

(assert (=> start!20276 tp!17836))

(declare-fun b!199578 () Bool)

(assert (=> b!199578 (= e!130994 tp_is_empty!4791)))

(declare-fun b!199579 () Bool)

(declare-fun res!94882 () Bool)

(assert (=> b!199579 (=> (not res!94882) (not e!130991))))

(declare-datatypes ((List!2608 0))(
  ( (Nil!2605) (Cons!2604 (h!3246 (_ BitVec 64)) (t!7539 List!2608)) )
))
(declare-fun arrayNoDuplicates!0 (array!8823 (_ BitVec 32) List!2608) Bool)

(assert (=> b!199579 (= res!94882 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2605))))

(declare-fun b!199580 () Bool)

(declare-fun res!94885 () Bool)

(assert (=> b!199580 (=> (not res!94885) (not e!130991))))

(assert (=> b!199580 (= res!94885 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4487 _keys!825))))))

(declare-fun b!199581 () Bool)

(declare-fun res!94886 () Bool)

(assert (=> b!199581 (=> (not res!94886) (not e!130991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8823 (_ BitVec 32)) Bool)

(assert (=> b!199581 (= res!94886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199582 () Bool)

(declare-fun res!94884 () Bool)

(assert (=> b!199582 (=> (not res!94884) (not e!130991))))

(assert (=> b!199582 (= res!94884 (and (= (size!4486 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4487 _keys!825) (size!4486 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199583 () Bool)

(declare-fun res!94887 () Bool)

(assert (=> b!199583 (=> (not res!94887) (not e!130991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199583 (= res!94887 (validKeyInArray!0 k0!843))))

(assert (= (and start!20276 res!94883) b!199582))

(assert (= (and b!199582 res!94884) b!199581))

(assert (= (and b!199581 res!94886) b!199579))

(assert (= (and b!199579 res!94882) b!199580))

(assert (= (and b!199580 res!94885) b!199583))

(assert (= (and b!199583 res!94887) b!199577))

(assert (= (and b!199577 res!94888) b!199574))

(assert (= (and b!199576 condMapEmpty!8255) mapIsEmpty!8255))

(assert (= (and b!199576 (not condMapEmpty!8255)) mapNonEmpty!8255))

(get-info :version)

(assert (= (and mapNonEmpty!8255 ((_ is ValueCellFull!2052) mapValue!8255)) b!199575))

(assert (= (and b!199576 ((_ is ValueCellFull!2052) mapDefault!8255)) b!199578))

(assert (= start!20276 b!199576))

(declare-fun m!226031 () Bool)

(assert (=> b!199577 m!226031))

(declare-fun m!226033 () Bool)

(assert (=> b!199579 m!226033))

(declare-fun m!226035 () Bool)

(assert (=> b!199583 m!226035))

(declare-fun m!226037 () Bool)

(assert (=> start!20276 m!226037))

(declare-fun m!226039 () Bool)

(assert (=> start!20276 m!226039))

(declare-fun m!226041 () Bool)

(assert (=> start!20276 m!226041))

(declare-fun m!226043 () Bool)

(assert (=> b!199574 m!226043))

(declare-fun m!226045 () Bool)

(assert (=> b!199574 m!226045))

(declare-fun m!226047 () Bool)

(assert (=> b!199574 m!226047))

(declare-fun m!226049 () Bool)

(assert (=> b!199574 m!226049))

(declare-fun m!226051 () Bool)

(assert (=> b!199574 m!226051))

(declare-fun m!226053 () Bool)

(assert (=> b!199574 m!226053))

(declare-fun m!226055 () Bool)

(assert (=> mapNonEmpty!8255 m!226055))

(declare-fun m!226057 () Bool)

(assert (=> b!199581 m!226057))

(check-sat tp_is_empty!4791 (not start!20276) (not mapNonEmpty!8255) (not b_next!4935) (not b!199574) (not b!199583) b_and!11681 (not b!199581) (not b!199579))
(check-sat b_and!11681 (not b_next!4935))
