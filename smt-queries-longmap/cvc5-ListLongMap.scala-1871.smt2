; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33660 () Bool)

(assert start!33660)

(declare-fun b_free!6895 () Bool)

(declare-fun b_next!6895 () Bool)

(assert (=> start!33660 (= b_free!6895 (not b_next!6895))))

(declare-fun tp!24189 () Bool)

(declare-fun b_and!14075 () Bool)

(assert (=> start!33660 (= tp!24189 b_and!14075)))

(declare-fun res!184259 () Bool)

(declare-fun e!205206 () Bool)

(assert (=> start!33660 (=> (not res!184259) (not e!205206))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33660 (= res!184259 (validMask!0 mask!2385))))

(assert (=> start!33660 e!205206))

(assert (=> start!33660 true))

(declare-fun tp_is_empty!6847 () Bool)

(assert (=> start!33660 tp_is_empty!6847))

(assert (=> start!33660 tp!24189))

(declare-datatypes ((V!10107 0))(
  ( (V!10108 (val!3468 Int)) )
))
(declare-datatypes ((ValueCell!3080 0))(
  ( (ValueCellFull!3080 (v!5630 V!10107)) (EmptyCell!3080) )
))
(declare-datatypes ((array!17287 0))(
  ( (array!17288 (arr!8174 (Array (_ BitVec 32) ValueCell!3080)) (size!8526 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17287)

(declare-fun e!205207 () Bool)

(declare-fun array_inv!6078 (array!17287) Bool)

(assert (=> start!33660 (and (array_inv!6078 _values!1525) e!205207)))

(declare-datatypes ((array!17289 0))(
  ( (array!17290 (arr!8175 (Array (_ BitVec 32) (_ BitVec 64))) (size!8527 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17289)

(declare-fun array_inv!6079 (array!17289) Bool)

(assert (=> start!33660 (array_inv!6079 _keys!1895)))

(declare-fun b!334272 () Bool)

(declare-fun res!184255 () Bool)

(declare-fun e!205208 () Bool)

(assert (=> b!334272 (=> (not res!184255) (not e!205208))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3159 0))(
  ( (MissingZero!3159 (index!14815 (_ BitVec 32))) (Found!3159 (index!14816 (_ BitVec 32))) (Intermediate!3159 (undefined!3971 Bool) (index!14817 (_ BitVec 32)) (x!33309 (_ BitVec 32))) (Undefined!3159) (MissingVacant!3159 (index!14818 (_ BitVec 32))) )
))
(declare-fun lt!159493 () SeekEntryResult!3159)

(declare-fun arrayContainsKey!0 (array!17289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334272 (= res!184255 (arrayContainsKey!0 _keys!1895 k!1348 (index!14816 lt!159493)))))

(declare-fun b!334273 () Bool)

(declare-fun res!184252 () Bool)

(assert (=> b!334273 (=> (not res!184252) (not e!205206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334273 (= res!184252 (validKeyInArray!0 k!1348))))

(declare-fun b!334274 () Bool)

(declare-fun e!205205 () Bool)

(assert (=> b!334274 (= e!205205 tp_is_empty!6847)))

(declare-fun b!334275 () Bool)

(declare-fun e!205204 () Bool)

(assert (=> b!334275 (= e!205204 tp_is_empty!6847)))

(declare-fun b!334276 () Bool)

(assert (=> b!334276 (= e!205206 e!205208)))

(declare-fun res!184253 () Bool)

(assert (=> b!334276 (=> (not res!184253) (not e!205208))))

(assert (=> b!334276 (= res!184253 (and (is-Found!3159 lt!159493) (= (select (arr!8175 _keys!1895) (index!14816 lt!159493)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17289 (_ BitVec 32)) SeekEntryResult!3159)

(assert (=> b!334276 (= lt!159493 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!334277 () Bool)

(declare-fun res!184258 () Bool)

(assert (=> b!334277 (=> (not res!184258) (not e!205206))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334277 (= res!184258 (and (= (size!8526 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8527 _keys!1895) (size!8526 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334278 () Bool)

(declare-fun res!184257 () Bool)

(assert (=> b!334278 (=> (not res!184257) (not e!205206))))

(declare-datatypes ((List!4659 0))(
  ( (Nil!4656) (Cons!4655 (h!5511 (_ BitVec 64)) (t!9747 List!4659)) )
))
(declare-fun arrayNoDuplicates!0 (array!17289 (_ BitVec 32) List!4659) Bool)

(assert (=> b!334278 (= res!184257 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4656))))

(declare-fun b!334279 () Bool)

(declare-fun mapRes!11667 () Bool)

(assert (=> b!334279 (= e!205207 (and e!205205 mapRes!11667))))

(declare-fun condMapEmpty!11667 () Bool)

(declare-fun mapDefault!11667 () ValueCell!3080)

