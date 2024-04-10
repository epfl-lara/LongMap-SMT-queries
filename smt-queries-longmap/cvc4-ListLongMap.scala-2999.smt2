; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42302 () Bool)

(assert start!42302)

(declare-fun b_free!11807 () Bool)

(declare-fun b_next!11807 () Bool)

(assert (=> start!42302 (= b_free!11807 (not b_next!11807))))

(declare-fun tp!41449 () Bool)

(declare-fun b_and!20245 () Bool)

(assert (=> start!42302 (= tp!41449 b_and!20245)))

(declare-fun res!281969 () Bool)

(declare-fun e!276720 () Bool)

(assert (=> start!42302 (=> (not res!281969) (not e!276720))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42302 (= res!281969 (validMask!0 mask!1365))))

(assert (=> start!42302 e!276720))

(declare-fun tp_is_empty!13235 () Bool)

(assert (=> start!42302 tp_is_empty!13235))

(assert (=> start!42302 tp!41449))

(assert (=> start!42302 true))

(declare-datatypes ((array!30227 0))(
  ( (array!30228 (arr!14535 (Array (_ BitVec 32) (_ BitVec 64))) (size!14887 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30227)

(declare-fun array_inv!10478 (array!30227) Bool)

(assert (=> start!42302 (array_inv!10478 _keys!1025)))

(declare-datatypes ((V!18751 0))(
  ( (V!18752 (val!6662 Int)) )
))
(declare-datatypes ((ValueCell!6274 0))(
  ( (ValueCellFull!6274 (v!8953 V!18751)) (EmptyCell!6274) )
))
(declare-datatypes ((array!30229 0))(
  ( (array!30230 (arr!14536 (Array (_ BitVec 32) ValueCell!6274)) (size!14888 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30229)

(declare-fun e!276719 () Bool)

(declare-fun array_inv!10479 (array!30229) Bool)

(assert (=> start!42302 (and (array_inv!10479 _values!833) e!276719)))

(declare-fun b!472024 () Bool)

(declare-fun res!281970 () Bool)

(assert (=> b!472024 (=> (not res!281970) (not e!276720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30227 (_ BitVec 32)) Bool)

(assert (=> b!472024 (= res!281970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472025 () Bool)

(declare-fun res!281972 () Bool)

(assert (=> b!472025 (=> (not res!281972) (not e!276720))))

(declare-datatypes ((List!8853 0))(
  ( (Nil!8850) (Cons!8849 (h!9705 (_ BitVec 64)) (t!14819 List!8853)) )
))
(declare-fun arrayNoDuplicates!0 (array!30227 (_ BitVec 32) List!8853) Bool)

(assert (=> b!472025 (= res!281972 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8850))))

(declare-fun b!472026 () Bool)

(declare-fun e!276716 () Bool)

(declare-fun mapRes!21559 () Bool)

(assert (=> b!472026 (= e!276719 (and e!276716 mapRes!21559))))

(declare-fun condMapEmpty!21559 () Bool)

(declare-fun mapDefault!21559 () ValueCell!6274)

