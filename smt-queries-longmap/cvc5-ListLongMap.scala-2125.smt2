; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35966 () Bool)

(assert start!35966)

(declare-fun b!361340 () Bool)

(declare-fun res!201004 () Bool)

(declare-fun e!221264 () Bool)

(assert (=> b!361340 (=> (not res!201004) (not e!221264))))

(declare-datatypes ((array!20295 0))(
  ( (array!20296 (arr!9636 (Array (_ BitVec 32) (_ BitVec 64))) (size!9988 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20295)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20295 (_ BitVec 32)) Bool)

(assert (=> b!361340 (= res!201004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361341 () Bool)

(declare-fun e!221262 () Bool)

(declare-datatypes ((List!5504 0))(
  ( (Nil!5501) (Cons!5500 (h!6356 (_ BitVec 64)) (t!10654 List!5504)) )
))
(declare-fun contains!2424 (List!5504 (_ BitVec 64)) Bool)

(assert (=> b!361341 (= e!221262 (contains!2424 Nil!5501 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361342 () Bool)

(assert (=> b!361342 (= e!221264 e!221262)))

(declare-fun res!201008 () Bool)

(assert (=> b!361342 (=> res!201008 e!221262)))

(assert (=> b!361342 (= res!201008 (contains!2424 Nil!5501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!14079 () Bool)

(declare-fun mapRes!14079 () Bool)

(declare-fun tp!28155 () Bool)

(declare-fun e!221266 () Bool)

(assert (=> mapNonEmpty!14079 (= mapRes!14079 (and tp!28155 e!221266))))

(declare-datatypes ((V!12139 0))(
  ( (V!12140 (val!4230 Int)) )
))
(declare-datatypes ((ValueCell!3842 0))(
  ( (ValueCellFull!3842 (v!6424 V!12139)) (EmptyCell!3842) )
))
(declare-fun mapRest!14079 () (Array (_ BitVec 32) ValueCell!3842))

(declare-fun mapValue!14079 () ValueCell!3842)

(declare-fun mapKey!14079 () (_ BitVec 32))

(declare-datatypes ((array!20297 0))(
  ( (array!20298 (arr!9637 (Array (_ BitVec 32) ValueCell!3842)) (size!9989 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20297)

(assert (=> mapNonEmpty!14079 (= (arr!9637 _values!1277) (store mapRest!14079 mapKey!14079 mapValue!14079))))

(declare-fun b!361343 () Bool)

(declare-fun e!221265 () Bool)

(declare-fun tp_is_empty!8371 () Bool)

(assert (=> b!361343 (= e!221265 tp_is_empty!8371)))

(declare-fun b!361344 () Bool)

(declare-fun res!201006 () Bool)

(assert (=> b!361344 (=> (not res!201006) (not e!221264))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361344 (= res!201006 (and (= (size!9989 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9988 _keys!1541) (size!9989 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361345 () Bool)

(declare-fun res!201005 () Bool)

(assert (=> b!361345 (=> (not res!201005) (not e!221264))))

(declare-fun noDuplicate!182 (List!5504) Bool)

(assert (=> b!361345 (= res!201005 (noDuplicate!182 Nil!5501))))

(declare-fun b!361346 () Bool)

(declare-fun res!201007 () Bool)

(assert (=> b!361346 (=> (not res!201007) (not e!221264))))

(assert (=> b!361346 (= res!201007 (and (bvsle #b00000000000000000000000000000000 (size!9988 _keys!1541)) (bvslt (size!9988 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun res!201009 () Bool)

(assert (=> start!35966 (=> (not res!201009) (not e!221264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35966 (= res!201009 (validMask!0 mask!1943))))

(assert (=> start!35966 e!221264))

(assert (=> start!35966 true))

(declare-fun e!221263 () Bool)

(declare-fun array_inv!7086 (array!20297) Bool)

(assert (=> start!35966 (and (array_inv!7086 _values!1277) e!221263)))

(declare-fun array_inv!7087 (array!20295) Bool)

(assert (=> start!35966 (array_inv!7087 _keys!1541)))

(declare-fun b!361347 () Bool)

(assert (=> b!361347 (= e!221266 tp_is_empty!8371)))

(declare-fun mapIsEmpty!14079 () Bool)

(assert (=> mapIsEmpty!14079 mapRes!14079))

(declare-fun b!361348 () Bool)

(assert (=> b!361348 (= e!221263 (and e!221265 mapRes!14079))))

(declare-fun condMapEmpty!14079 () Bool)

(declare-fun mapDefault!14079 () ValueCell!3842)

