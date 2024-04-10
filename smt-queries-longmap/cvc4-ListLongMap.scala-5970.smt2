; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77650 () Bool)

(assert start!77650)

(declare-fun b_free!16235 () Bool)

(declare-fun b_next!16235 () Bool)

(assert (=> start!77650 (= b_free!16235 (not b_next!16235))))

(declare-fun tp!56966 () Bool)

(declare-fun b_and!26623 () Bool)

(assert (=> start!77650 (= tp!56966 b_and!26623)))

(declare-fun b!905328 () Bool)

(declare-fun e!507317 () Bool)

(declare-fun tp_is_empty!18653 () Bool)

(assert (=> b!905328 (= e!507317 tp_is_empty!18653)))

(declare-fun b!905329 () Bool)

(declare-fun res!610918 () Bool)

(declare-fun e!507321 () Bool)

(assert (=> b!905329 (=> res!610918 e!507321)))

(declare-datatypes ((V!29835 0))(
  ( (V!29836 (val!9377 Int)) )
))
(declare-fun lt!408512 () V!29835)

(declare-datatypes ((tuple2!12196 0))(
  ( (tuple2!12197 (_1!6109 (_ BitVec 64)) (_2!6109 V!29835)) )
))
(declare-datatypes ((List!18007 0))(
  ( (Nil!18004) (Cons!18003 (h!19149 tuple2!12196) (t!25414 List!18007)) )
))
(declare-datatypes ((ListLongMap!10893 0))(
  ( (ListLongMap!10894 (toList!5462 List!18007)) )
))
(declare-fun lt!408515 () ListLongMap!10893)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!451 (ListLongMap!10893 (_ BitVec 64)) V!29835)

(assert (=> b!905329 (= res!610918 (not (= (apply!451 lt!408515 k!1033) lt!408512)))))

(declare-fun b!905330 () Bool)

(declare-fun e!507319 () Bool)

(declare-fun e!507318 () Bool)

(assert (=> b!905330 (= e!507319 e!507318)))

(declare-fun res!610911 () Bool)

(assert (=> b!905330 (=> (not res!610911) (not e!507318))))

(declare-fun lt!408516 () ListLongMap!10893)

(declare-fun contains!4508 (ListLongMap!10893 (_ BitVec 64)) Bool)

(assert (=> b!905330 (= res!610911 (contains!4508 lt!408516 k!1033))))

(declare-datatypes ((ValueCell!8845 0))(
  ( (ValueCellFull!8845 (v!11882 V!29835)) (EmptyCell!8845) )
))
(declare-datatypes ((array!53350 0))(
  ( (array!53351 (arr!25634 (Array (_ BitVec 32) ValueCell!8845)) (size!26093 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53350)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29835)

(declare-datatypes ((array!53352 0))(
  ( (array!53353 (arr!25635 (Array (_ BitVec 32) (_ BitVec 64))) (size!26094 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53352)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29835)

(declare-fun getCurrentListMap!2729 (array!53352 array!53350 (_ BitVec 32) (_ BitVec 32) V!29835 V!29835 (_ BitVec 32) Int) ListLongMap!10893)

(assert (=> b!905330 (= lt!408516 (getCurrentListMap!2729 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905331 () Bool)

(assert (=> b!905331 (= e!507321 true)))

(assert (=> b!905331 (= (apply!451 lt!408516 k!1033) lt!408512)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((Unit!30716 0))(
  ( (Unit!30717) )
))
(declare-fun lt!408514 () Unit!30716)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!7 (array!53352 array!53350 (_ BitVec 32) (_ BitVec 32) V!29835 V!29835 (_ BitVec 64) V!29835 (_ BitVec 32) Int) Unit!30716)

(assert (=> b!905331 (= lt!408514 (lemmaListMapApplyFromThenApplyFromZero!7 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408512 i!717 defaultEntry!1160))))

(declare-fun b!905332 () Bool)

(declare-fun res!610912 () Bool)

(assert (=> b!905332 (=> (not res!610912) (not e!507319))))

(assert (=> b!905332 (= res!610912 (and (= (size!26093 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26094 _keys!1386) (size!26093 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905333 () Bool)

(declare-fun res!610910 () Bool)

(assert (=> b!905333 (=> (not res!610910) (not e!507318))))

(assert (=> b!905333 (= res!610910 (and (= (select (arr!25635 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905334 () Bool)

(declare-fun res!610915 () Bool)

(assert (=> b!905334 (=> (not res!610915) (not e!507319))))

(declare-datatypes ((List!18008 0))(
  ( (Nil!18005) (Cons!18004 (h!19150 (_ BitVec 64)) (t!25415 List!18008)) )
))
(declare-fun arrayNoDuplicates!0 (array!53352 (_ BitVec 32) List!18008) Bool)

(assert (=> b!905334 (= res!610915 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18005))))

(declare-fun mapIsEmpty!29692 () Bool)

(declare-fun mapRes!29692 () Bool)

(assert (=> mapIsEmpty!29692 mapRes!29692))

(declare-fun res!610914 () Bool)

(assert (=> start!77650 (=> (not res!610914) (not e!507319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77650 (= res!610914 (validMask!0 mask!1756))))

(assert (=> start!77650 e!507319))

(declare-fun e!507316 () Bool)

(declare-fun array_inv!20084 (array!53350) Bool)

(assert (=> start!77650 (and (array_inv!20084 _values!1152) e!507316)))

(assert (=> start!77650 tp!56966))

(assert (=> start!77650 true))

(assert (=> start!77650 tp_is_empty!18653))

(declare-fun array_inv!20085 (array!53352) Bool)

(assert (=> start!77650 (array_inv!20085 _keys!1386)))

(declare-fun mapNonEmpty!29692 () Bool)

(declare-fun tp!56967 () Bool)

(declare-fun e!507320 () Bool)

(assert (=> mapNonEmpty!29692 (= mapRes!29692 (and tp!56967 e!507320))))

(declare-fun mapValue!29692 () ValueCell!8845)

(declare-fun mapRest!29692 () (Array (_ BitVec 32) ValueCell!8845))

(declare-fun mapKey!29692 () (_ BitVec 32))

(assert (=> mapNonEmpty!29692 (= (arr!25634 _values!1152) (store mapRest!29692 mapKey!29692 mapValue!29692))))

(declare-fun b!905335 () Bool)

(declare-fun res!610913 () Bool)

(assert (=> b!905335 (=> (not res!610913) (not e!507318))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905335 (= res!610913 (inRange!0 i!717 mask!1756))))

(declare-fun b!905336 () Bool)

(declare-fun e!507315 () Bool)

(assert (=> b!905336 (= e!507315 e!507321)))

(declare-fun res!610916 () Bool)

(assert (=> b!905336 (=> res!610916 e!507321)))

(assert (=> b!905336 (= res!610916 (not (contains!4508 lt!408515 k!1033)))))

(assert (=> b!905336 (= lt!408515 (getCurrentListMap!2729 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905337 () Bool)

(declare-fun res!610917 () Bool)

(assert (=> b!905337 (=> (not res!610917) (not e!507319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53352 (_ BitVec 32)) Bool)

(assert (=> b!905337 (= res!610917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905338 () Bool)

(assert (=> b!905338 (= e!507316 (and e!507317 mapRes!29692))))

(declare-fun condMapEmpty!29692 () Bool)

(declare-fun mapDefault!29692 () ValueCell!8845)

