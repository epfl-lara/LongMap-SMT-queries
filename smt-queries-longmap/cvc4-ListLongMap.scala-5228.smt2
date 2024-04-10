; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70436 () Bool)

(assert start!70436)

(declare-fun b_free!12779 () Bool)

(declare-fun b_next!12779 () Bool)

(assert (=> start!70436 (= b_free!12779 (not b_next!12779))))

(declare-fun tp!45067 () Bool)

(declare-fun b_and!21599 () Bool)

(assert (=> start!70436 (= tp!45067 b_and!21599)))

(declare-fun b!818163 () Bool)

(declare-fun e!454116 () Bool)

(declare-fun tp_is_empty!14489 () Bool)

(assert (=> b!818163 (= e!454116 tp_is_empty!14489)))

(declare-fun res!558397 () Bool)

(declare-fun e!454117 () Bool)

(assert (=> start!70436 (=> (not res!558397) (not e!454117))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70436 (= res!558397 (validMask!0 mask!1312))))

(assert (=> start!70436 e!454117))

(assert (=> start!70436 tp_is_empty!14489))

(declare-datatypes ((array!45178 0))(
  ( (array!45179 (arr!21644 (Array (_ BitVec 32) (_ BitVec 64))) (size!22065 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45178)

(declare-fun array_inv!17309 (array!45178) Bool)

(assert (=> start!70436 (array_inv!17309 _keys!976)))

(assert (=> start!70436 true))

(declare-datatypes ((V!24319 0))(
  ( (V!24320 (val!7292 Int)) )
))
(declare-datatypes ((ValueCell!6829 0))(
  ( (ValueCellFull!6829 (v!9721 V!24319)) (EmptyCell!6829) )
))
(declare-datatypes ((array!45180 0))(
  ( (array!45181 (arr!21645 (Array (_ BitVec 32) ValueCell!6829)) (size!22066 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45180)

(declare-fun e!454118 () Bool)

(declare-fun array_inv!17310 (array!45180) Bool)

(assert (=> start!70436 (and (array_inv!17310 _values!788) e!454118)))

(assert (=> start!70436 tp!45067))

(declare-fun mapNonEmpty!23329 () Bool)

(declare-fun mapRes!23329 () Bool)

(declare-fun tp!45066 () Bool)

(assert (=> mapNonEmpty!23329 (= mapRes!23329 (and tp!45066 e!454116))))

(declare-fun mapRest!23329 () (Array (_ BitVec 32) ValueCell!6829))

(declare-fun mapKey!23329 () (_ BitVec 32))

(declare-fun mapValue!23329 () ValueCell!6829)

(assert (=> mapNonEmpty!23329 (= (arr!21645 _values!788) (store mapRest!23329 mapKey!23329 mapValue!23329))))

(declare-fun b!818164 () Bool)

(declare-fun res!558394 () Bool)

(assert (=> b!818164 (=> (not res!558394) (not e!454117))))

(declare-datatypes ((List!15414 0))(
  ( (Nil!15411) (Cons!15410 (h!16539 (_ BitVec 64)) (t!21741 List!15414)) )
))
(declare-fun arrayNoDuplicates!0 (array!45178 (_ BitVec 32) List!15414) Bool)

(assert (=> b!818164 (= res!558394 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15411))))

(declare-fun b!818165 () Bool)

(declare-fun res!558395 () Bool)

(assert (=> b!818165 (=> (not res!558395) (not e!454117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45178 (_ BitVec 32)) Bool)

(assert (=> b!818165 (= res!558395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818166 () Bool)

(declare-fun e!454119 () Bool)

(assert (=> b!818166 (= e!454118 (and e!454119 mapRes!23329))))

(declare-fun condMapEmpty!23329 () Bool)

(declare-fun mapDefault!23329 () ValueCell!6829)

