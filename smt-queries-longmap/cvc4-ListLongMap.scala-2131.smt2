; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36040 () Bool)

(assert start!36040)

(declare-fun from!1924 () (_ BitVec 32))

(declare-datatypes ((array!20377 0))(
  ( (array!20378 (arr!9674 (Array (_ BitVec 32) (_ BitVec 64))) (size!10026 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20377)

(declare-fun e!221657 () Bool)

(declare-fun b!361918 () Bool)

(declare-fun k!1134 () (_ BitVec 64))

(assert (=> b!361918 (= e!221657 (and (not (= (select (arr!9674 _keys!1541) from!1924) k!1134)) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1924) (size!10026 _keys!1541)) (bvsge (size!10026 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun res!201349 () Bool)

(assert (=> start!36040 (=> (not res!201349) (not e!221657))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36040 (= res!201349 (validMask!0 mask!1943))))

(assert (=> start!36040 e!221657))

(assert (=> start!36040 true))

(declare-fun array_inv!7118 (array!20377) Bool)

(assert (=> start!36040 (array_inv!7118 _keys!1541)))

(declare-datatypes ((V!12191 0))(
  ( (V!12192 (val!4250 Int)) )
))
(declare-datatypes ((ValueCell!3862 0))(
  ( (ValueCellFull!3862 (v!6445 V!12191)) (EmptyCell!3862) )
))
(declare-datatypes ((array!20379 0))(
  ( (array!20380 (arr!9675 (Array (_ BitVec 32) ValueCell!3862)) (size!10027 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20379)

(declare-fun e!221659 () Bool)

(declare-fun array_inv!7119 (array!20379) Bool)

(assert (=> start!36040 (and (array_inv!7119 _values!1277) e!221659)))

(declare-fun b!361919 () Bool)

(declare-fun res!201352 () Bool)

(assert (=> b!361919 (=> (not res!201352) (not e!221657))))

(declare-datatypes ((List!5519 0))(
  ( (Nil!5516) (Cons!5515 (h!6371 (_ BitVec 64)) (t!10669 List!5519)) )
))
(declare-fun arrayNoDuplicates!0 (array!20377 (_ BitVec 32) List!5519) Bool)

(assert (=> b!361919 (= res!201352 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5516))))

(declare-fun b!361920 () Bool)

(declare-fun e!221658 () Bool)

(declare-fun tp_is_empty!8411 () Bool)

(assert (=> b!361920 (= e!221658 tp_is_empty!8411)))

(declare-fun b!361921 () Bool)

(declare-fun res!201351 () Bool)

(assert (=> b!361921 (=> (not res!201351) (not e!221657))))

(assert (=> b!361921 (= res!201351 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10026 _keys!1541))))))

(declare-fun b!361922 () Bool)

(declare-fun res!201350 () Bool)

(assert (=> b!361922 (=> (not res!201350) (not e!221657))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361922 (= res!201350 (and (= (size!10027 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10026 _keys!1541) (size!10027 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14148 () Bool)

(declare-fun mapRes!14148 () Bool)

(declare-fun tp!28224 () Bool)

(declare-fun e!221661 () Bool)

(assert (=> mapNonEmpty!14148 (= mapRes!14148 (and tp!28224 e!221661))))

(declare-fun mapValue!14148 () ValueCell!3862)

(declare-fun mapRest!14148 () (Array (_ BitVec 32) ValueCell!3862))

(declare-fun mapKey!14148 () (_ BitVec 32))

(assert (=> mapNonEmpty!14148 (= (arr!9675 _values!1277) (store mapRest!14148 mapKey!14148 mapValue!14148))))

(declare-fun mapIsEmpty!14148 () Bool)

(assert (=> mapIsEmpty!14148 mapRes!14148))

(declare-fun b!361923 () Bool)

(declare-fun res!201353 () Bool)

(assert (=> b!361923 (=> (not res!201353) (not e!221657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20377 (_ BitVec 32)) Bool)

(assert (=> b!361923 (= res!201353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361924 () Bool)

(declare-fun res!201348 () Bool)

(assert (=> b!361924 (=> (not res!201348) (not e!221657))))

(declare-fun arrayContainsKey!0 (array!20377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361924 (= res!201348 (arrayContainsKey!0 _keys!1541 k!1134 from!1924))))

(declare-fun b!361925 () Bool)

(assert (=> b!361925 (= e!221661 tp_is_empty!8411)))

(declare-fun b!361926 () Bool)

(assert (=> b!361926 (= e!221659 (and e!221658 mapRes!14148))))

(declare-fun condMapEmpty!14148 () Bool)

(declare-fun mapDefault!14148 () ValueCell!3862)

