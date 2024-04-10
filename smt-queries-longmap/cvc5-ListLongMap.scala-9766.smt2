; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115718 () Bool)

(assert start!115718)

(declare-fun b!1368378 () Bool)

(declare-fun res!911894 () Bool)

(declare-fun e!775316 () Bool)

(assert (=> b!1368378 (=> (not res!911894) (not e!775316))))

(declare-datatypes ((List!31947 0))(
  ( (Nil!31944) (Cons!31943 (h!33152 (_ BitVec 64)) (t!46641 List!31947)) )
))
(declare-fun newAcc!98 () List!31947)

(declare-fun contains!9629 (List!31947 (_ BitVec 64)) Bool)

(assert (=> b!1368378 (= res!911894 (not (contains!9629 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368379 () Bool)

(declare-fun e!775317 () Bool)

(assert (=> b!1368379 (= e!775316 e!775317)))

(declare-fun res!911888 () Bool)

(assert (=> b!1368379 (=> (not res!911888) (not e!775317))))

(declare-datatypes ((array!92910 0))(
  ( (array!92911 (arr!44879 (Array (_ BitVec 32) (_ BitVec 64))) (size!45429 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92910)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun acc!866 () List!31947)

(declare-fun arrayNoDuplicates!0 (array!92910 (_ BitVec 32) List!31947) Bool)

(assert (=> b!1368379 (= res!911888 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45195 0))(
  ( (Unit!45196) )
))
(declare-fun lt!602055 () Unit!45195)

(declare-fun noDuplicateSubseq!218 (List!31947 List!31947) Unit!45195)

(assert (=> b!1368379 (= lt!602055 (noDuplicateSubseq!218 newAcc!98 acc!866))))

(declare-fun b!1368380 () Bool)

(declare-fun res!911891 () Bool)

(assert (=> b!1368380 (=> (not res!911891) (not e!775316))))

(assert (=> b!1368380 (= res!911891 (not (contains!9629 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368381 () Bool)

(declare-fun res!911887 () Bool)

(assert (=> b!1368381 (=> (not res!911887) (not e!775316))))

(declare-fun noDuplicate!2486 (List!31947) Bool)

(assert (=> b!1368381 (= res!911887 (noDuplicate!2486 acc!866))))

(declare-fun b!1368382 () Bool)

(declare-fun res!911895 () Bool)

(assert (=> b!1368382 (=> (not res!911895) (not e!775317))))

(assert (=> b!1368382 (= res!911895 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368383 () Bool)

(declare-fun res!911890 () Bool)

(assert (=> b!1368383 (=> (not res!911890) (not e!775317))))

(assert (=> b!1368383 (= res!911890 (bvslt from!3239 (size!45429 a!3861)))))

(declare-fun b!1368384 () Bool)

(declare-fun res!911896 () Bool)

(assert (=> b!1368384 (=> (not res!911896) (not e!775316))))

(declare-fun subseq!1031 (List!31947 List!31947) Bool)

(assert (=> b!1368384 (= res!911896 (subseq!1031 newAcc!98 acc!866))))

(declare-fun res!911893 () Bool)

(assert (=> start!115718 (=> (not res!911893) (not e!775316))))

(assert (=> start!115718 (= res!911893 (and (bvslt (size!45429 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45429 a!3861))))))

(assert (=> start!115718 e!775316))

(declare-fun array_inv!33907 (array!92910) Bool)

(assert (=> start!115718 (array_inv!33907 a!3861)))

(assert (=> start!115718 true))

(declare-fun b!1368385 () Bool)

(assert (=> b!1368385 (= e!775317 false)))

(declare-fun lt!602056 () Bool)

(assert (=> b!1368385 (= lt!602056 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368386 () Bool)

(declare-fun res!911892 () Bool)

(assert (=> b!1368386 (=> (not res!911892) (not e!775316))))

(assert (=> b!1368386 (= res!911892 (not (contains!9629 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368387 () Bool)

(declare-fun res!911886 () Bool)

(assert (=> b!1368387 (=> (not res!911886) (not e!775317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368387 (= res!911886 (not (validKeyInArray!0 (select (arr!44879 a!3861) from!3239))))))

(declare-fun b!1368388 () Bool)

(declare-fun res!911889 () Bool)

(assert (=> b!1368388 (=> (not res!911889) (not e!775316))))

(assert (=> b!1368388 (= res!911889 (not (contains!9629 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115718 res!911893) b!1368381))

(assert (= (and b!1368381 res!911887) b!1368388))

(assert (= (and b!1368388 res!911889) b!1368380))

(assert (= (and b!1368380 res!911891) b!1368386))

(assert (= (and b!1368386 res!911892) b!1368378))

(assert (= (and b!1368378 res!911894) b!1368384))

(assert (= (and b!1368384 res!911896) b!1368379))

(assert (= (and b!1368379 res!911888) b!1368383))

(assert (= (and b!1368383 res!911890) b!1368387))

(assert (= (and b!1368387 res!911886) b!1368382))

(assert (= (and b!1368382 res!911895) b!1368385))

(declare-fun m!1252363 () Bool)

(assert (=> b!1368387 m!1252363))

(assert (=> b!1368387 m!1252363))

(declare-fun m!1252365 () Bool)

(assert (=> b!1368387 m!1252365))

(declare-fun m!1252367 () Bool)

(assert (=> start!115718 m!1252367))

(declare-fun m!1252369 () Bool)

(assert (=> b!1368388 m!1252369))

(declare-fun m!1252371 () Bool)

(assert (=> b!1368378 m!1252371))

(declare-fun m!1252373 () Bool)

(assert (=> b!1368381 m!1252373))

(declare-fun m!1252375 () Bool)

(assert (=> b!1368379 m!1252375))

(declare-fun m!1252377 () Bool)

(assert (=> b!1368379 m!1252377))

(declare-fun m!1252379 () Bool)

(assert (=> b!1368380 m!1252379))

(declare-fun m!1252381 () Bool)

(assert (=> b!1368386 m!1252381))

(declare-fun m!1252383 () Bool)

(assert (=> b!1368384 m!1252383))

(declare-fun m!1252385 () Bool)

(assert (=> b!1368385 m!1252385))

(push 1)

