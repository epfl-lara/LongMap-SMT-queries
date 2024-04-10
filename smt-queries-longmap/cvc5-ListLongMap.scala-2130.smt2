; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36018 () Bool)

(assert start!36018)

(declare-fun mapNonEmpty!14130 () Bool)

(declare-fun mapRes!14130 () Bool)

(declare-fun tp!28206 () Bool)

(declare-fun e!221550 () Bool)

(assert (=> mapNonEmpty!14130 (= mapRes!14130 (and tp!28206 e!221550))))

(declare-datatypes ((V!12179 0))(
  ( (V!12180 (val!4245 Int)) )
))
(declare-datatypes ((ValueCell!3857 0))(
  ( (ValueCellFull!3857 (v!6440 V!12179)) (EmptyCell!3857) )
))
(declare-datatypes ((array!20355 0))(
  ( (array!20356 (arr!9664 (Array (_ BitVec 32) ValueCell!3857)) (size!10016 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20355)

(declare-fun mapKey!14130 () (_ BitVec 32))

(declare-fun mapValue!14130 () ValueCell!3857)

(declare-fun mapRest!14130 () (Array (_ BitVec 32) ValueCell!3857))

(assert (=> mapNonEmpty!14130 (= (arr!9664 _values!1277) (store mapRest!14130 mapKey!14130 mapValue!14130))))

(declare-fun b!361742 () Bool)

(declare-fun res!201242 () Bool)

(declare-fun e!221552 () Bool)

(assert (=> b!361742 (=> (not res!201242) (not e!221552))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-datatypes ((array!20357 0))(
  ( (array!20358 (arr!9665 (Array (_ BitVec 32) (_ BitVec 64))) (size!10017 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20357)

(assert (=> b!361742 (= res!201242 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10017 _keys!1541))))))

(declare-fun b!361743 () Bool)

(declare-fun e!221549 () Bool)

(declare-fun tp_is_empty!8401 () Bool)

(assert (=> b!361743 (= e!221549 tp_is_empty!8401)))

(declare-fun mapIsEmpty!14130 () Bool)

(assert (=> mapIsEmpty!14130 mapRes!14130))

(declare-fun res!201237 () Bool)

(assert (=> start!36018 (=> (not res!201237) (not e!221552))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36018 (= res!201237 (validMask!0 mask!1943))))

(assert (=> start!36018 e!221552))

(assert (=> start!36018 true))

(declare-fun array_inv!7108 (array!20357) Bool)

(assert (=> start!36018 (array_inv!7108 _keys!1541)))

(declare-fun e!221553 () Bool)

(declare-fun array_inv!7109 (array!20355) Bool)

(assert (=> start!36018 (and (array_inv!7109 _values!1277) e!221553)))

(declare-fun b!361744 () Bool)

(assert (=> b!361744 (= e!221550 tp_is_empty!8401)))

(declare-fun b!361745 () Bool)

(declare-fun res!201240 () Bool)

(assert (=> b!361745 (=> (not res!201240) (not e!221552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20357 (_ BitVec 32)) Bool)

(assert (=> b!361745 (= res!201240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361746 () Bool)

(declare-fun res!201238 () Bool)

(assert (=> b!361746 (=> (not res!201238) (not e!221552))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361746 (= res!201238 (and (= (size!10016 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10017 _keys!1541) (size!10016 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun k!1134 () (_ BitVec 64))

(declare-fun b!361747 () Bool)

(assert (=> b!361747 (= e!221552 (and (not (= (select (arr!9665 _keys!1541) from!1924) k!1134)) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) (size!10017 _keys!1541))))))

(declare-fun b!361748 () Bool)

(declare-fun res!201239 () Bool)

(assert (=> b!361748 (=> (not res!201239) (not e!221552))))

(declare-datatypes ((List!5514 0))(
  ( (Nil!5511) (Cons!5510 (h!6366 (_ BitVec 64)) (t!10664 List!5514)) )
))
(declare-fun arrayNoDuplicates!0 (array!20357 (_ BitVec 32) List!5514) Bool)

(assert (=> b!361748 (= res!201239 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5511))))

(declare-fun b!361749 () Bool)

(assert (=> b!361749 (= e!221553 (and e!221549 mapRes!14130))))

(declare-fun condMapEmpty!14130 () Bool)

(declare-fun mapDefault!14130 () ValueCell!3857)

