; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43614 () Bool)

(assert start!43614)

(declare-fun b_free!12349 () Bool)

(declare-fun b_next!12349 () Bool)

(assert (=> start!43614 (= b_free!12349 (not b_next!12349))))

(declare-fun tp!43335 () Bool)

(declare-fun b_and!21113 () Bool)

(assert (=> start!43614 (= tp!43335 b_and!21113)))

(declare-fun res!287946 () Bool)

(declare-fun e!284341 () Bool)

(assert (=> start!43614 (=> (not res!287946) (not e!284341))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43614 (= res!287946 (validMask!0 mask!2352))))

(assert (=> start!43614 e!284341))

(assert (=> start!43614 true))

(declare-fun tp_is_empty!13861 () Bool)

(assert (=> start!43614 tp_is_empty!13861))

(declare-datatypes ((V!19553 0))(
  ( (V!19554 (val!6978 Int)) )
))
(declare-datatypes ((ValueCell!6569 0))(
  ( (ValueCellFull!6569 (v!9273 V!19553)) (EmptyCell!6569) )
))
(declare-datatypes ((array!31383 0))(
  ( (array!31384 (arr!15092 (Array (_ BitVec 32) ValueCell!6569)) (size!15450 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31383)

(declare-fun e!284338 () Bool)

(declare-fun array_inv!10890 (array!31383) Bool)

(assert (=> start!43614 (and (array_inv!10890 _values!1516) e!284338)))

(assert (=> start!43614 tp!43335))

(declare-datatypes ((array!31385 0))(
  ( (array!31386 (arr!15093 (Array (_ BitVec 32) (_ BitVec 64))) (size!15451 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31385)

(declare-fun array_inv!10891 (array!31385) Bool)

(assert (=> start!43614 (array_inv!10891 _keys!1874)))

(declare-fun b!483166 () Bool)

(declare-fun res!287949 () Bool)

(assert (=> b!483166 (=> (not res!287949) (not e!284341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31385 (_ BitVec 32)) Bool)

(assert (=> b!483166 (= res!287949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!483167 () Bool)

(declare-fun res!287950 () Bool)

(assert (=> b!483167 (=> (not res!287950) (not e!284341))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483167 (= res!287950 (validKeyInArray!0 k!1332))))

(declare-fun mapIsEmpty!22507 () Bool)

(declare-fun mapRes!22507 () Bool)

(assert (=> mapIsEmpty!22507 mapRes!22507))

(declare-fun b!483168 () Bool)

(declare-fun res!287951 () Bool)

(declare-fun e!284337 () Bool)

(assert (=> b!483168 (=> res!287951 e!284337)))

(declare-datatypes ((SeekEntryResult!3574 0))(
  ( (MissingZero!3574 (index!16475 (_ BitVec 32))) (Found!3574 (index!16476 (_ BitVec 32))) (Intermediate!3574 (undefined!4386 Bool) (index!16477 (_ BitVec 32)) (x!45378 (_ BitVec 32))) (Undefined!3574) (MissingVacant!3574 (index!16478 (_ BitVec 32))) )
))
(declare-fun lt!218998 () SeekEntryResult!3574)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!483168 (= res!287951 (not (inRange!0 (index!16476 lt!218998) mask!2352)))))

(declare-fun b!483169 () Bool)

(declare-fun res!287948 () Bool)

(assert (=> b!483169 (=> (not res!287948) (not e!284341))))

(declare-fun minValue!1458 () V!19553)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19553)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9162 0))(
  ( (tuple2!9163 (_1!4592 (_ BitVec 64)) (_2!4592 V!19553)) )
))
(declare-datatypes ((List!9242 0))(
  ( (Nil!9239) (Cons!9238 (h!10094 tuple2!9162) (t!15460 List!9242)) )
))
(declare-datatypes ((ListLongMap!8075 0))(
  ( (ListLongMap!8076 (toList!4053 List!9242)) )
))
(declare-fun contains!2669 (ListLongMap!8075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2372 (array!31385 array!31383 (_ BitVec 32) (_ BitVec 32) V!19553 V!19553 (_ BitVec 32) Int) ListLongMap!8075)

(assert (=> b!483169 (= res!287948 (contains!2669 (getCurrentListMap!2372 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!483170 () Bool)

(declare-fun e!284342 () Bool)

(assert (=> b!483170 (= e!284342 tp_is_empty!13861)))

(declare-fun b!483171 () Bool)

(assert (=> b!483171 (= e!284338 (and e!284342 mapRes!22507))))

(declare-fun condMapEmpty!22507 () Bool)

(declare-fun mapDefault!22507 () ValueCell!6569)

