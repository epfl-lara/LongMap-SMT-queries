; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36962 () Bool)

(assert start!36962)

(declare-fun b_free!8089 () Bool)

(declare-fun b_next!8089 () Bool)

(assert (=> start!36962 (= b_free!8089 (not b_next!8089))))

(declare-fun tp!28982 () Bool)

(declare-fun b_and!15331 () Bool)

(assert (=> start!36962 (= tp!28982 b_and!15331)))

(declare-fun b!370775 () Bool)

(declare-fun e!226410 () Bool)

(declare-fun e!226415 () Bool)

(assert (=> b!370775 (= e!226410 e!226415)))

(declare-fun res!208281 () Bool)

(assert (=> b!370775 (=> (not res!208281) (not e!226415))))

(declare-datatypes ((array!21417 0))(
  ( (array!21418 (arr!10177 (Array (_ BitVec 32) (_ BitVec 64))) (size!10529 (_ BitVec 32))) )
))
(declare-fun lt!170044 () array!21417)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21417 (_ BitVec 32)) Bool)

(assert (=> b!370775 (= res!208281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170044 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21417)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370775 (= lt!170044 (array!21418 (store (arr!10177 _keys!658) i!548 k!778) (size!10529 _keys!658)))))

(declare-fun b!370776 () Bool)

(declare-fun res!208287 () Bool)

(assert (=> b!370776 (=> (not res!208287) (not e!226410))))

(declare-datatypes ((List!5692 0))(
  ( (Nil!5689) (Cons!5688 (h!6544 (_ BitVec 64)) (t!10842 List!5692)) )
))
(declare-fun arrayNoDuplicates!0 (array!21417 (_ BitVec 32) List!5692) Bool)

(assert (=> b!370776 (= res!208287 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5689))))

(declare-fun b!370777 () Bool)

(declare-fun res!208282 () Bool)

(assert (=> b!370777 (=> (not res!208282) (not e!226415))))

(assert (=> b!370777 (= res!208282 (arrayNoDuplicates!0 lt!170044 #b00000000000000000000000000000000 Nil!5689))))

(declare-fun b!370778 () Bool)

(declare-fun res!208286 () Bool)

(assert (=> b!370778 (=> (not res!208286) (not e!226410))))

(assert (=> b!370778 (= res!208286 (or (= (select (arr!10177 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10177 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370779 () Bool)

(declare-fun e!226413 () Bool)

(declare-fun tp_is_empty!8737 () Bool)

(assert (=> b!370779 (= e!226413 tp_is_empty!8737)))

(declare-fun b!370780 () Bool)

(declare-fun res!208280 () Bool)

(assert (=> b!370780 (=> (not res!208280) (not e!226410))))

(assert (=> b!370780 (= res!208280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370781 () Bool)

(declare-fun res!208284 () Bool)

(assert (=> b!370781 (=> (not res!208284) (not e!226410))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12755 0))(
  ( (V!12756 (val!4413 Int)) )
))
(declare-datatypes ((ValueCell!4025 0))(
  ( (ValueCellFull!4025 (v!6610 V!12755)) (EmptyCell!4025) )
))
(declare-datatypes ((array!21419 0))(
  ( (array!21420 (arr!10178 (Array (_ BitVec 32) ValueCell!4025)) (size!10530 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21419)

(assert (=> b!370781 (= res!208284 (and (= (size!10530 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10529 _keys!658) (size!10530 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!208289 () Bool)

(assert (=> start!36962 (=> (not res!208289) (not e!226410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36962 (= res!208289 (validMask!0 mask!970))))

(assert (=> start!36962 e!226410))

(declare-fun e!226411 () Bool)

(declare-fun array_inv!7516 (array!21419) Bool)

(assert (=> start!36962 (and (array_inv!7516 _values!506) e!226411)))

(assert (=> start!36962 tp!28982))

(assert (=> start!36962 true))

(assert (=> start!36962 tp_is_empty!8737))

(declare-fun array_inv!7517 (array!21417) Bool)

(assert (=> start!36962 (array_inv!7517 _keys!658)))

(declare-fun b!370782 () Bool)

(declare-fun res!208288 () Bool)

(assert (=> b!370782 (=> (not res!208288) (not e!226410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370782 (= res!208288 (validKeyInArray!0 k!778))))

(declare-fun b!370783 () Bool)

(declare-fun res!208285 () Bool)

(assert (=> b!370783 (=> (not res!208285) (not e!226410))))

(declare-fun arrayContainsKey!0 (array!21417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370783 (= res!208285 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!370784 () Bool)

(declare-fun mapRes!14670 () Bool)

(assert (=> b!370784 (= e!226411 (and e!226413 mapRes!14670))))

(declare-fun condMapEmpty!14670 () Bool)

(declare-fun mapDefault!14670 () ValueCell!4025)

